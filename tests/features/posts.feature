Feature: posts
  In order to browse the posts
  As an user
  I need to be able to open the posts section

  Scenario: Open posts page
    Given I am on "/blog/pt-br/"
    Then I should see "Home" in the "title" element

  Scenario Outline: Open published posts
    Given I am on "/blog/pt-br/<date>/<post>"
    Then the response status code should be 200

    Examples:
      | date    | post                                |
      | 2019/09 | ressuscitando-o-blog                |
      | 2019/11 | compilando-o-php-a-partir-do-pacote |

  Scenario Outline: View published posts assets
    Given I am on "/content/posts/pt-br/<date>/<post>/<asset>"
    Then the response status code should be 200

    Examples:
        | date    | post                                | asset                |
        | 2019/11 | compilando-o-php-a-partir-do-pacote | qa-report-prompt.png |
