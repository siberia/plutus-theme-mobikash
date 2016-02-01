{*
 * Displays a list of statements by month which can be downloaded.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015-2016 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Your Statements" nav="accounts"}

<h1>Download your statement</h1>

<p>
Please choose a format to download your transaction data in.  PDF or CSV.
</p>

{if $months|@count eq 0}
<p>
You presently do not have any account statements available for download.
</p>
{/if}

<table class="table">
  <thead>
    <tr>
      <th>Month</th>
      <th>Format</th>
    </tr>
  </thead>
  <tbody>
{foreach $months item=row}
    <tr>
      <td>{$row.month_name}</td>
      <td><a href="/{if $account.account_type eq 'wallet'}accounts{else}businessaccounts{/if}/{$account.uuid}/statements/{$row.month_yyyymm}/csv">CSV</a> &bull; PDF</td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
