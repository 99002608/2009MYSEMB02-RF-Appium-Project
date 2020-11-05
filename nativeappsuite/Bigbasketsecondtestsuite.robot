*** Settings ***
Documentation    This file covers the test cases for validating Shop by Categories
...    with multiple data
Library    AppiumLibrary    
Library    Process    
Test Template    TC2_ShopByCategoryTemplate



*** Keywords ***
Open Native App
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2
    ...    appPackage=com.bigbasket.mobileapp
    ...    appActivity=com.bigbasket.mobileapp.activity.SplashActivity
    ...    noReset=true
    Set Appium Timeout    30s  
    
TC2_ShopByCategoryTemplate
    [Arguments]    ${Selectedvalue}
    Open Native App
    Sleep    5S    
    Click Element    //*[@content-desc='Open navigation']
    ${elements}    Get Webelements    //*[@resource-id='com.bigbasket.mobileapp:id/title']
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Log To Console    ${text}
        Run Keyword If    '${text}'=='${Selectedvalue}'    Click Element    ${element} 
        Exit For Loop If    '${text}'=='${Selectedvalue}'      
    END
    
*** Test Cases ***
TC2_ShopByCategoryTest    The Beauty Store
TC3_ShopByCategoryTest    Smart Basket 
TC4_ShopByCategoryTest    Home  
   
        