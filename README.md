## by using Robot framework with python libraries I automate the signup page of "https://www.phptravels.net" 


1. Test case will pass if first name starts with capital letter and first name not equal the last name.

2. Test case will fail if irst name starts with small letter and first name equal to the last name.

3. All fields are mandatory to complete the signup process 


My Project files:
1. testcases (valid_signup.robot,invalid_signup.robot,resource)
2. output.xml 
3. report.html: report library is used to generate reports automatically with passed 
                and failed testcases and to explain the reason of each fail
               
## Prerequisit:
Before using this code you should install the following libraries:

1. robotframework 
2. robotframework-seleniumlibrary
3. robotframework-seleniumscreenshots
4. selenium
