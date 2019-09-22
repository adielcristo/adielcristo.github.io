Feature: posts
  In order to browse the posts
  As an user
  I need to be able to open the posts section

  Scenario: Open posts page
    Given I am on "/blog/pt/"
    Then I should see "Home" in the "title" element

  Scenario Outline: Open published posts
    Given I am on "/blog/pt/<date>/<post>"
    Then the response status code should be 200

      Examples:
        | date        | post                 |
        |  2019/09/21 | ressuscitando-o-blog |
