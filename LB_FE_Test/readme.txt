Language Required : Ruby 2.4.3 or higher
IDE : RubyMine 

Step 1: Download and install Ruby 2.4.3 or higher (preferably in C Drive. It should create a folder named Ruby24-x64)
Step 2: Download and install RubyMine 2019.1.2 or higher
Step 3: Clone Git repo
Step 4: Open RubyMine and select File>>Open (browse to the folder LB_FE_test and open it)
Step 5: In RubyMine enter Ctrl+F12 to open console
Step 6: Navigate to the automation folder "LB_FE_Test\automation" via command "CD automation" (The Gemfile  is located under automation folder)
Step 7: Execute command Gem install Bundler
Step 8: Execute command Bundle install
Step 9: Open Gemfile from project explorer in the left Navigation of RubyMine and wait for a couple of minutes for the IDE to detect all Gems
(If any of the Gems are not detected ( or installed) RubyMine will highlight and underline them in the Gem file. In this case execute command bundle update in the console.
at anypoint if you want to start over and reinstall the Gems then execute the command gem uninstall –aIx then go to Step 6. Any individual gem can be install via the command
gem install <gem name> -v <version number>)
Step 10: Set a system environment variable with name = "ExecutionEnv" and value = "staging" 
Alternative to Step 10: If you do not want to set Environment variable on your machine then you may use Ryubymine to do so.
In RubyMine click Run>>Edit Configurations . In the Environment Variables text box in the right, click on the notepad icon on the right of the textbox. On the pop-up window selct the + symbol and 
add new Environment variable with name = "ExecutionEnv" and value = "staging" 
Step 11: Download the chromedriver.exe and paste it in Ruby instal location : ..Ruby24-x64/bin

After all the Gems have been installed:

Project Folder Structure:
automation : Root 
config: Contains configuration files
confg/data -> Test detect folder, typically file names corespond to the page where the test data will be used. E.g. userlogins.yml has user login data
config/environments -> Environment data for E.g. Page Urls , API URLs etc.
driver : just a backup in case chromedriver is not found. the hooks.rb can be configured to locate driver from this location (the code has been commented out)
features: Contains feature files (test cases) like userActions.feature which have the Gherkins
step_definitions: Contains the definition for each step in the Gherkin and directs to the page where the gherkin step action needs to be performed. Typically Step definitions are named after the feature file
appended with an _steps E.g. <feature_steps>.rb
support: contains env.rb which can be used to specify gems required in every page of the project
hooks.rb: this file has two sections "Before" and "After". Here the steps that need to be performed "before" and "after" execution of each test scenario can be defined.
lib: It has two folders 1. pages 2. models (has not been used in this project)
pages : contain the class files representing each page in the application and are typically named <page_name>.rb
 
Running the tests:
in RubyMine console (Alt + F12) : bundle exec cucumber features/userActions.feature


