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
     
I validate the test
    Wait Until Page Contains Element    //*[@text='560004,Bangalore- 560004']    
    Page Should Contain Element    //*[@text='560004,Bangalore- 560004']   
    

