# MobiKash theme for Plutus

This theme is a starting point for building your theme for Plutus.  Please note that
Plutus uses Smarty for parsing templates and rendering the results to the web browser.

| URL                         | Template                  | Notes                                                    |
| --------------------------- | ------------------------- | -------------------------------------------------------- |
| /accounts                   | accounts.tpl              | User dashboard that shows their accounts                 |
| /accounts/UUID/statements   | account__statements.tpl   | Shows the user the links for downloadable statements.    |
| /accounts/UUID/transactions | account__transactions.tpl | Shows the transactions that have occurred on an account. |
| /login                      | login.tpl                 | Login Page -- shown to users before they login           |
| /settings/autoload          | settings__autoload.tpl    | Configures the users autoload settings.                  |
| /transfer                   | transfer.tpl              | Interaccount transfer                                    |

## Common Templates

A number of templates are symlinked in from ../../common and live are available from
https://github.com/jacques/common-smarty-templates

To clone the common template repo from the command line:

```
git clone https://github.com/jacques/common-smarty-templates.git
```

| Template                   | Notes                                                                              |
| -------------------------- | ---------------------------------------------------------------------------------- |
| _partials/header-bsfa.tpl  | Includes Bootstrap 3.3.5 and Font Awesome 4.4.0 Stylesheets                        |
| _partials/header-csrf.tpl  | Used for jquery-rails-ui to have the CSRF token for POST, PUT and DELETE requests. |
| _partials/header-shims.tpl | Includes HTML5 Shim and Respond.js for IE8                                         |

## Quick Start Guide

Including another template:

```
{include file="footer.tpl"}
```
