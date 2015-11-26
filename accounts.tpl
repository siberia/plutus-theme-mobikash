{*
 * Customer Dashboard - used to display information on debit cards,
 * mobile wallets, etc.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Accounts Page"}

      <div>
        <h2 class=page-header">MobiKash Dashboard</h2>

        <hr />
      </div>

      <div>

{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

        <div class="alert alert-info">
          Are you expecting a deposit and cannot see it?  No problem, call the call centre on 08610 46664.  This can happen if your reference was not correct when the deposit was made.
        </div>

        <h3>My Accounts</h3>

        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th>Account Name</th>
              <th>Balance</th>
            </tr>
          </thead>
          <tbody>
{foreach $accounts item=row}
            <tr>
{if $row.account_type eq 'wallet'}
              <td><i class="fa fa-money"></i> MobiKash Account &mdash; {$row.account_number} <div class="pull-right"><a href="/accounts/{$row.uuid}/transactions">View Transactions</a> &bull; <a href="/accounts/{$row.uuid}/statements">View statements</a></div></td>
              <td><div class="pull-right">R {($row.balance/100)|string_format:"%.2f"}</div></td>
{else}
              <td><i class="fa fa-credit-card"></i> MobiKash Pre-paid Debit Card &mdash; {$row.masked_cardnumber} <div class="pull-right"></div></td>
              <td>&nbsp;</td>
{/if}
            </tr>
{/foreach}
{foreach $business_accounts item=row}
            <tr>
              <td><i class="fa fa-money"></i> MobiKash Business Account &mdash; {$row.account_number} <div class="pull-right"><a href="/businessaccounts/{$row.uuid}/users">View Users</a> &bull; <a href="/businessaccounts/{$row.uuid}/transactions">View Transactions</a> &bull; <a href="/businessaccounts/{$row.uuid}/statements">View statements</a></div></td>
              <td><div class="pull-right">R {($row.balance/100)|string_format:"%.2f"}</div></td>
            </tr>
{/foreach}
          </tbody>
        </table>
      </div>

{include file="footer.tpl"}
