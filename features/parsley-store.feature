Feature: Cached parsind of Scientific Names
  In order to be able to parse scientific names super fast
  A user should be able to parse and cache and retrieve results
  So I want to implement Redis backend to a parser

  Scenario: Connecting to local redis database
    Given Redis server is running locally
    Then I get "LOCAL" and "SLAVE" databases connection
