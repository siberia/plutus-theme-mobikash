{*
 * Transfer money between personal wallets and business accounts.  Perform cardloads
 * to debitcards.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015 Jacques Marneweck.  All rights strictly reserved.
 *}
{include file="header.tpl" title="Transfer Between Accounts Page" nav="transfer"}

      <div>
        <h2 class="page-header">Transfer Between Accounts</h2>
      </div>

      <div>
{include file="_partials/success.tpl"}
{include file="_partials/errors.tpl"}

     <form method="post" class="form-horizontal" role="form" accept-charset="UTF-8">
<input name="utf8" type="hidden" value="&#x2713;" />
{include file="_partials/csrf.tpl"}
       <div class="form-group">
         <label for="inputSourceAccount"  class="col-sm-2 control-label">Pay From Account</label>
         <div class="col-sm-10">
               <select class="form-control" name="source" id="source">
{foreach $accounts item=row}
{if $row.account_type eq 'wallet'}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>MobiKash Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{else}
{*
Need to still check what the card rules for MobiKash are
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>MobiKash Pre-paid Debit Card &mdash; {$row.masked_cardnumber}</option>
*}
{/if}
{/foreach}
{foreach $business_accounts item=row}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>MobiKash Business Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{/foreach}
      </select>
         </div>
       </div>
       <div class="form-group">
         <label for="inputSourceReference" class="col-sm-2 control-label">Pay From Reference</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="source_reference">
         </div>
       </div>
       <div class="form-group">
         <label for="inputSourceAccount"  class="col-sm-2 control-label">Pay To Account</label>
         <div class="col-sm-10">
      <select class="form-control" name="destination" id="destination">
{foreach $accounts item=row}
{if $row.account_type eq 'wallet'}
                 <option value="{$row.uuid}"{if isset($smarty.post.destination) && $smarty.post.destination eq $row.uuid} selected{/if}>MobiKash Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{else}
                 <option value="{$row.uuid}"{if isset($smarty.post.destination) && $smarty.post.destination eq $row.uuid} selected{/if}>MobiKash Pre-paid Debit Card &mdash; {$row.masked_cardnumber}</option>
{/if}
{/foreach}
{foreach $business_accounts item=row}
                 <option value="{$row.uuid}"{if isset($smarty.post.source) && $smarty.post.source eq $row.uuid} selected{/if}>MobiKash Business Account &mdash; {$row.account_number} (R {($row.balance/100)|string_format:"%.2f"})</option>
{/foreach}
      </select>
         </div>
       </div>
       <div class="form-group">
         <label for="inputDestinationReference" class="col-sm-2 control-label">Pay To Reference</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="destination_reference">
         </div>
       </div>
       <div class="form-group">
         <label for="inputAmount" class="col-sm-2 control-label">Amount</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" name="amount">
         </div>
       </div>
       <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <button data-disable-with="Processing ..." type="submit" class="btn btn-primary"{if $smarty.session.fica_status eq 0} disabled{/if}>Transfer</button>
          </div>
        </div>
      </form>
    </div>

{if $smarty.session.fica_status eq 0}
{include file="_partials/fica_notice_transact.tpl"}
{/if}

{include file="footer.tpl"}
