
#
# Author: ITTDigital
#
@automated @pect_test @pect_tc003
Feature: User accesses About PECT Portal and accesses COVID-19 in the Vaccines Page
    Background:
        Given The browser resolution is '1367' per '768'



    Scenario: PECT-TC003-A: Access COVID 19 information
        Given I navigate to external page 'https://www.pfizerclinicaltrials.com/'
        Then I expect that element 'PECT > home page > logo' is displayed
        When I click on 'PECT > home page > covid-19 clinical trails'
        #Then Page 'https://www.pfizerclinicaltrials.com/find-a-trial/COVID-19' is loaded
        Then The page url is 'https://www.pfizerclinicaltrials.com/find-a-trial/COVID-19'
        Then I expect that element 'PECT > find a trail filter page > search box' is displayed



    Scenario: PECT-TC003-B: Validate certain COVID19 information
        Given I navigate to external page 'https://www.pfizerclinicaltrials.com/'
        When I click on 'PECT > accept cookie'
        Then I expect that element 'PECT > home page > logo' is displayed
        When I click on 'PECT > home page > our research'
        Then The page url is 'https://www.pfizerclinicaltrials.com/our-research'
        Then I expect that element 'PECT > our research page > vaccines' is displayed
        When I click on 'PECT > our research page > vaccines'
        Then The page url is 'https://www.pfizerclinicaltrials.com/our-research/vaccines'
        When I click on 'PECT > vaccine clinical trials page > covid 19'
        Then The page url contains 'https://www.pfizerclinicaltrials.com/find-a-trial/Coronavirus%20,COVID-19'


  Scenario: PECT-TC003-C: Validate COVID 19 search data
        Given I navigate to external page 'https://www.pfizerclinicaltrials.com/'
        When I click on 'PECT > accept cookie'
        When I hover over 'PECT > home page > find a trial nav'
        Then I expect that element 'PECT > home page > find trail search flyout' is displayed
        When I set text 'COVID-19' to field 'PECT > home page > find trail search flyout'
        When I click on 'PECT > home page > find trail button flyout'

        #Then PECT_TC003_C User then compares the data collected in the above step004 and step005
#      Examples:
#          | name |
#          | COVID-19 |
#          #| covid-19 |

#
