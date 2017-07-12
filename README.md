# IVCT Runtime

This is example configuration for a recommended IVCT deployment structure. The required elements are:
- A folder for the SuT configuration files
- A folder for the badge definition files
- A folder for the test suite run time environments
- The test engine, configured for the installed test suites
- The LogSink component to generate the test result reports
- The ActiveMQ component
- The Apache Tomcat installation including the IVCT GUI web applications

The IVCT user intefaces (UI and GUI) are using a properties file to configure the first three folders, like

IVCT_SUT_HOME_ID=C:\\IVCT_Runtime\\IVCTsut
IVCT_TS_HOME_ID=C:\\IVCT_Runtime\\Badges
IVCT_BADGE_HOME_ID=C:\\IVCT_Runtime\\Badges

More information can be found in the wiki (https://github.com/MSG134/IVCT_Runtime/wiki)
