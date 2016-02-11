{*
 * Login page
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015-2016 Jacques Marneweck.  All rights strictly reserved.
 *}
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="Jacques Marneweck // www.leopardrock.com">
    <meta name="copyright" content="2014-2016 Jacques Marneweck.  All rights strictly reserved.">
    <meta name="keywords" content="mobikash, mobi money, money, wallet, account, eftdebit, eftcredit, debitcard, debitcards, banking, bank, payroll, debitorder, debitorders, eftpos, standing order, debitorder, garnishee order">
    <meta name="description" content="MobiKash &mdash; My Life, My Money, My Way">
    <title>MobiKash &mdash; My Life, My Money, My Way &mdash; Signin</title>
{include file="_partials/header-bsfa.tpl"}
    <link href="/css/mobikash.css" rel="stylesheet">

    <script type="text/javascript">
      (window.top == window.self) || (window.top.location.href = self.location.href);
    </script>

{include file="_partials/header-shims.tpl"}
{include file="_partials/staging-ribbon.tpl" host="secure.mobikash.co.za"}
{literal}
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55853251-2', 'auto');
  ga('send', 'pageview');

</script>
{/literal}
  </head>
  <body>

    <div class="container">
      <div class="header">
        <h3 class="text-muted signin-logo"><img src="/images/brands/mobikash.png" alt="IMOGO" height="200"></h3>
      </div>

      <div class="form-signin">
        <h2 class=page-header">Login to your account</h2>

{if isset($smarty.session.flash.errors)}<div class="alert alert-danger" role="alert">{$smarty.session.flash.errors.0}</div>{/if}

      <form accept-charset="UTF-8" method="post" autocomplete="off" class="form-horizontal" role="form">
        <input name="utf8" type="hidden" value="&#x2713;" />
        <input name="{$csrf_key}" type="hidden" value="{$csrf_token}" />

  <div class="form-group">
    <label for="inputUsername3" class="col-sm-2 control-label">Username</label>
    <div class="col-sm-10">
      <input type="text" name="username" class="form-control" id="inputUsername3" placeholder="Username">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button data-disable-with="Processing ..." type="submit" class="btn btn-primary">Sign in</button>
    </div>
  </div>
</form>

<p>
  <a href="/mobile/mobikash">Mobile Login</a>
</p>
<div>

      <footer>
        <p>&copy; 2014&mdash;2015 MobiKash South Africa (Pty) Ltd and/or it's licensors.  All rights strictly reserved.  MobiKash South Africa (Pty) Ltd is a juristic representative of FSP 6814. Call Centre: 08610 46664.
        </p>

        <p>
          Hosted by our friends at <a href="https://kaizengarden.co/">Kaizen Garden</a>.  Made with &hearts; in Cape Town by <a href="http://www.siberia.co.za/">Siberia</a>.
        </p>
      </footer>
    </div>

{if $usecdn}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
{else}
    <script src="/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
{/if}
    <script src="/vendor/jquery-ujs/src/rails.js"></script>
{include file="_partials/gauges.tpl"}
  </body>
</html>
