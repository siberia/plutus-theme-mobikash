{include file="header.tpl" title="Account Transactions Page"}

<h1 class="hidden-print">Account Transactions</h1>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Account Number</th>
      <th>Description</th>
      <th>Account Type</th>
      <th>Available Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{$account.account_number}</td>
      <td>{$account.description|escape}</td>
      <td>{if $account.account_type == 'wallet'}MobiKash Account{elseif $account.account_type == 'business'}MobiKash Business Account{/if}</td>
      <td>R {($account.balance/100)|string_format:"%.2f"}</td>
    </tr>
  </tbody>
</table>

<form method="POST" class="form-inline">
  <input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
{include file="_partials/reports-filter-month.tpl"}
<button type="submit" class="btn btn-info">Filter</button>
</form>

<table class="table table-striped">
  <thead>
    <tr>
      <th>Action Date</th>
      <th>Reference</th>
      <th>Description</th>
      <th>&nbsp;</th>
      <th>Amount</th>
    </tr>
  </thead>
  <tbody>
{assign var=running_total value=0}
{foreach $transactions item=row}
{assign var=running_total value=$running_total+$row.amount}
    <tr>
      <td>{$row.action_date}</td>
      <td>{$row.transaction_reference}</td>
      <td>{$row.reference1}</td>
      <td>{$row.reference2}</td>
      <td><div class="pull-right">R {($row.amount/100)|string_format:"%.2f"}</div></td>
    </tr>
{/foreach}
  </tbody>
</table>

{include file="footer.tpl"}
