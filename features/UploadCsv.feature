Feature: Upload CSV file

Scenario: See Upload button
  Given I am not logged in                    
    And I am on the surveys home page           
    Then I should see "Log in"                  
    When I sign in with valid credentials       
    Then I should see "Signed in successfully."
    And I should see "Upload CSV"

Scenario: Visit Upload CSV page and upload blank file
  Given I am not logged in                    
    And I am on the surveys home page           
    Then I should see "Log in"                  
    When I sign in with valid credentials       
    Then I should see "Signed in successfully."  
    And I follow "Upload CSV"
    Then I should see "Upload A New CSV File"
    And I follow "Upload A New CSV File"
    Then I should see "Attachment"
    And I press "Save"
    Then I should see "Name can't be blank"

 Scenario:Given I am not logged in                    
   And I am on the surveys home page           
   Then I should see "Log in"                  
   When I sign in with valid credentials       
   Then I should see "Signed in successfully."  
   And I follow "Upload CSV"
   Then I should see "Download Link"
   And I follow "View Graphs"
   Then I should see "Chart"