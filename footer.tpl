{*
 * Common footer for the theme (used on most pages excluding the terms and conditions
 * road block page, login page, etc.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright 2015 Jacques Marneweck.  All rights strictly reserved.
 *}
  <div class="container hidden-print">
    Signed in as <strong>{$smarty.session.first_name|escape} {$smarty.session.last_name|escape}</strong>.
  </div>

{include file="_partials/footer-jqbs.tpl"}
  <script src="/vendor/jquery-ujs/src/rails.js"></script>
  <script src="/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script src="/js/platform.js"></script>
{if $smarty.server.REQUEST_URI eq '/transfer'}
{literal}
<script>
jQuery(document).ready(function(){
  $('#source').change(function(){
    var selected_val = $(this).val();
    $('#destination').empty();
    $('#source').find('option').clone().appendTo('#destination');
    $("#destination option[value='"+ selected_val +"']").remove();
  });
});
</script>
{/literal}
{/if}
{if $smarty.server.REQUEST_URI eq '/beneficiaries/add'}
{literal}
<script>
jQuery(document).ready(function(){
  $('#inputBank').change(function(){
    var selected_val = $(this).val();
    $('#inputBranchCode').val(banks[selected_val]);
  });
});
</script>
{/literal}
{/if}
{if $smarty.server.REQUEST_URI eq '/prepaid/airtime'}
{literal}
<script>
jQuery(document).ready(function(){
  $('#inputNetwork').change(function(){
    console.log($(this).find('option:selected').val());
    var selected = $(this).find('option:selected').val();

    switch (selected) {
      case 'vodacom':
      case 'mtn':
      case 'cellc':
      case 'virginmobile':
      case 'telkommobile':
      case 'telkom':
      case 'neotel':
        $('#vouchers').show();
        $.ajax({
          cache:false,
          url:'/prepaid/airtime/ajax/networks',
          type:'POST',
          data: JSON.stringify({ 'network': selected, '{/literal}{$csrf_key}{literal}': '{/literal}{$csrf_token}{literal}' }),
          dataType: 'json',
          contentType: 'application/json; charset=utf-8',
          success: function(json) {
            $('#voucher').empty();
            $.each(json, function(i, data) {
              console.log(data);
              $('#voucher').append('<option value="' + data['voucher_code'] + '">' + data['description'] + '</option>');
            });
          }
        });
        break;
      default:
        $('#vouchers').hide();
      break;
    }

  }).change();
  $('#vouchers').hide();
});
</script>
{/literal}
{/if}
{if $smarty.server.REQUEST_URI eq '/settings/autoload'}
{literal}
<script>
jQuery(document).ready(function(){
  $('#inputAutoloadType').change(function(){
    console.log($(this).find('option:selected').val());
    var selected = $(this).find('option:selected').val();
    if (selected == 'percentage') {
      $('#percentage').show();
      $('#monetary').hide();
    } else {
      $('#percentage').hide();
      $('#monetary').show();
    }
  }).change();

  if ($('#inputAutoloadType option:selected').val() == 'percentage') {
    $('#percentage').show();
    $('#monetary').hide();
  } else {
    $('#percentage').hide();
    $('#monetary').show();
  }
});
</script>
{/literal}
{/if}
{if (array_key_exists('brand', $smarty.session))}
{literal}
<script type="text/javascript">
$(function() {
  window.localStorage.setItem("token", "{/literal}{$smarty.session.token}{literal}");
});
</script>
{/literal}
{/if}
{include file="_partials/gauges.tpl"}
  </body>
</html>
