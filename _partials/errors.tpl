{*
 * Used to display 'error' messages to indicate some action had errors or a
 * form contained numerous errors.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015 Jacques Marneweck.  All rights strictly reserved.
 *}
{if isset($smarty.session.flash.errors)}
  {foreach $smarty.session.flash.errors item=error}
    <div class="alert alert-danger" role="alert">{$error}</div>
  {/foreach}
{/if}
