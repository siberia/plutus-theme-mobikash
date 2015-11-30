{*
 * Used to display the FICA documents requirement.  I.e. users with FICA status
 * zero can't transact and has view only access to their account.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *}
{if $smarty.session.fica_status eq 0}
  <div class="alert alert-info">
    Please provide a certified copy of your ID before you are able to start transacting on the MobiKash system.  Call centre: 08610 46664.
  </div>
{/if}
