*** Settings ***
Documentation    This file covers the test cases for validating Adding And Removing Items
Library    AppiumLibrary    
Library    Process    
Test Template    TC3_AddingAndRemovingItemsTemplate

*** Keywords ***
Open Native App
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2
    ...    appPackage=com.bigbasket.mobileapp
    ...    appActivity=com.bigbasket.mobileapp.activity.SplashActivity
    ...    noReset=true
    Set Appium Timeout    30s  
 
TC3_AddingAndRemovingItemsTemplate
    [Arguments]    ${remote_url}
    Open Native App
    Sleep    5S    
    Click Element    //*[@text='Categories']
    Wait Until Page Contains Element    //*[@text='Fruits & Vegetables']    
    Click Element    //*[@text='Fruits & Vegetables']
    Wait Until Page Contains Element    //*[@text='All Fruits & Vegetables'] 
    Click Element    //*[@text='All Fruits & Vegetables']
    Wait Until Page Contains Element    //*[@resource-id='com.bigbasket.mobileapp:id/imgCategory']        
    Click Element    //*[@resource-id='com.bigbasket.mobileapp:id/imgCategory']
    #Wait Until Page Contains Element    //*[@text='Add']  
    #Click Element    xpath=(//*[@text='Add'])[1]
    #Click Element    xpath=(//*[@text='Add'])[2]
    FOR    ${i}    IN RANGE    1    5
       Wait Until Page Contains Element    xpath=//*[@text='Add'] 
       Click Element    xpath=//*[@text='Add']
       #Swipe    607    1568    620    1181
       Swipe By Percent    90    75    90    30    
    END  
    Swipe By Percent    90    75    90    80
    Sleep    2s    
    Wait Until Page Contains Element    //*[@text='Basket']    
    Click Element    //*[@text='Basket']
    Wait Until Page Contains Element    //*[@resource-id='com.bigbasket.mobileapp:id/total_price_tv']    
    ${price}    Get Text    //*[@resource-id='com.bigbasket.mobileapp:id/total_price_tv']
    Log To Console    ${price}   
    Wait Until Page Contains Element    //*[@content-desc='Remove'] 
    FOR    ${i}    IN RANGE    1    5
       Wait Until Page Contains Element    //*[@content-desc='Remove']
       Click Element    //*[@content-desc='Remove']
       
    END      
 
    
*** Test Cases ***    
TC3_AddingAndRemovingItemsTest    ABCD 
    



    