Feature: Upload CSV file

Scenario: See Upload button
  Given I am logged in                    
    And I am on the surveys home page                            
    When I sign in with valid credentials       
    Then I should see "Signed in successfully."
    And I should see "Upload CSV"

Scenario: Visit Upload CSV page and upload blank file
  Given I am logged in                    
    And I am on the surveys home page                            
    When I sign in with valid credentials       
    Then I should see "Signed in successfully."  
    And I follow "Upload CSV"
    Then I should see "Upload A New CSV File"
    And I follow "Upload A New CSV File"
    Then I should see "Attachment"
    And I press "Save"
    Then I should see "Name can't be blank"

 Scenario:
   Given I am logged in                    
   And I am on the surveys home page                           
   When I sign in with valid credentials       
   Then I should see "Signed in successfully."  
   And I follow "Upload CSV"
   Then I should see "Download Link"
   And I follow "View Graphs"
   Then I should see "Chart"

Scenario:
   Given I am not logged in                    
   And I am on the surveys home page           
   Then I should see "Log in"                  
   When I sign in with valid credentials       
   Then I should see "Signed in successfully."  
   And I follow "Upload CSV"
   Then I should see "Download Link"
   And I follow "View Graphs"
   And I select "day" from "xaxis"
   And I press "Make Graph"
   Then I should see "Chart"

Scenario:
  Given I am logged in
  Then I should see "View Graph"
  When I follow "View Graph"
  And I select "r bc" from "xaxis"
  And I press "Make Graph"
  Then I should see "Chart"

Scenario: Add a survey
  Given I am logged in
  Then I should be on the surveys home page
  When I follow "Create New Survey"
  Then I should be on the Create New Survey page
  When I fill in "Survey Name" with "My Test Survey"
  And I fill in "Surveyor Name" with "Mr. XYZ"
  And I fill in "Survey Description" with "Details"
  And I press "Save Changes"
  Then I should be on the surveys home page
  And I should see "My Test Survey"

Scenario: Delete Survey
  Given I am logged in
  Then I should see "Delete Survey"
  When I follow "Delete Survey"
  Then I should see "deleted."

Scenario: Delete CSV file
  Given I am logged in
  Then I should see "Take the survey"
  When I follow "Upload CSV"
  Then I should see "Delete"
  When I follow "Delete"
  Then I should see "deleted."



