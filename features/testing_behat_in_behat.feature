Feature: Testing Behat in Behat
    In order to test a context used to test Behat
    As a Behat extension developer
    I want to run Behat while running Behat

    Background:
        Given a Behat configuration containing:
        """
        default:
            suites:
                default:
                    contexts:
                        - FriendsOfBehat\TestContext\Context\TestContext
        """
        And a context file "features/bootstrap/FeatureContext.php" containing:
        """
        <?php

        use Behat\Behat\Context\Context;

        class FeatureContext implements Context
        {
            /** @Then it passes */
            public function itPasses() {}

            /** @Then it passes with output :output */
            public function itPassesWithOutput($output) { echo $output; }
        }
        """

    Scenario: Passing scenario
        Given a feature file "features/test.feature" containing:
        """
        Feature: Passing feature

            Scenario: Passing scenario
                Then it passes
        """
        When I run Behat
        Then it should pass

    Scenario: Passing scenario with output
        Given a feature file "features/test.feature" containing:
        """
        Feature: Passing feature with output

            Scenario: Passing scenario with output
                Then it passes with output "Krzysztof Krawczyk"
        """
        When I run Behat
        Then it should pass with:
        """
        Krzysztof Krawczyk
        """
