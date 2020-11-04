*** Settings ***
Library    AppiumLibrary    
Library    Process    
Test Template    TC1_LoginTemplate



*** Keywords ***
Open Native App
    Open Application    remote_url=http://localhost:4723/wd/hub  
    ...    platformName=android    deviceName=pixel 2
    ...    appPackage=com.bigbasket.mobileapp
    ...    appActivity=com.bigbasket.mobileapp.activity.SplashActivity
    ...    noReset=true
    Set Appium Timeout    30s  
    
TC1_LoginTemplate
    [Arguments]    ${remote_url}
    Open Native App
    Sleep    5S    
    Click Element    //*[@content-desc='Open navigation']
    Wait Until Page Contains Element    //*[@text='560004,Bangalore- 560004']    
    Page Should Contain Element    //*[@text='560004,Bangalore- 560004']   
    
*** Test Cases ***
TC1_LoginTest    ABCD 
    


    
 


    