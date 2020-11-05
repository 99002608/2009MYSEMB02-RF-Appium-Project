*** Settings ***
Library    AppiumLibrary    
Library    Process  


*** Keywords ***
I have launched Big Basket application
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2
    ...    appPackage=com.bigbasket.mobileapp
    ...    appActivity=com.bigbasket.mobileapp.activity.SplashActivity
    ...    noReset=true
    Set Appium Timeout    30s  
    
I click open navigation
     Sleep    5S    
     Click Element    //*[@content-desc='Open navigation']
     
I click shop by category as "${Selectedvalue}"
    ${elements}    Get Webelements    //*[@resource-id='com.bigbasket.mobileapp:id/title']
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Log To Console    ${text}
        Run Keyword If    '${text}'=='${Selectedvalue}'    Click Element    ${element} 
        Exit For Loop If    '${text}'=='${Selectedvalue}'      
    END
    
I click on adding and removing items
    Sleep    5S    
    Click Element    //*[@text='Categories']
    Wait Until Page Contains Element    //*[@text='Fruits & Vegetables']    
    Click Element    //*[@text='Fruits & Vegetables']
    Wait Until Page Contains Element    //*[@text='All Fruits & Vegetables'] 
    Click Element    //*[@text='All Fruits & Vegetables']
    Wait Until Page Contains Element    //*[@resource-id='com.bigbasket.mobileapp:id/imgCategory']        
    Click Element    //*[@resource-id='com.bigbasket.mobileapp:id/imgCategory']
    FOR    ${i}    IN RANGE    1    5
       Wait Until Page Contains Element    xpath=//*[@text='Add'] 
       Click Element    xpath=//*[@text='Add']
       Swipe By Percent    90    75    90    30    
    END  
    Swipe By Percent    90    75    90    80
    Sleep    2s    
    Wait Until Page Contains Element    //*[@text='Basket']    
    Click Element    //*[@text='4']
    Wait Until Page Contains Element    //*[@resource-id='com.bigbasket.mobileapp:id/total_price_tv']    
    ${price}    Get Text    //*[@resource-id='com.bigbasket.mobileapp:id/total_price_tv']
    Log To Console    ${price}   
    Wait Until Page Contains Element    //*[@content-desc='Remove'] 
    FOR    ${i}    IN RANGE    1    5
       Wait Until Page Contains Element    //*[@content-desc='Remove']
       Click Element    //*[@content-desc='Remove']
       
    END      
     
I validate the test
    Sleep    5S    
    Click Element    //*[@content-desc='Open navigation']
    Wait Until Page Contains Element    //*[@text='560004,Bangalore- 560004']    
    Page Should Contain Element    //*[@text='560004,Bangalore- 560004']   
    

