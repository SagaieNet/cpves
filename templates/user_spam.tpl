<form action="?module=user_spam" name="spam" method="post">
<table>
	<tr>
		<td>Spamfilter aktiv:</td>
		<td><select id="spamassassin_active" name="spamassassin_active">
		<option value="1" onclick="cpves_sa_active('1');">Ja</option>
		{if $spamassassin_active eq '0' }
		<option value="0" onclick="cpves_sa_active('0');" selected="selected">Nein</option>
		{else}
		<option value="0" onclick="cpves_sa_active('0');">Nein</option>
		{/if}
		</select></td>
	</tr>
	
	{if $p_bogofilter == 1}
	<tr>
		<td>Bogofilter aktiv:</td>
		<td><select id="bogofilter_active" name="bogofilter_active">
		<option value="1">Ja</option>
		{if $bogofilter_active == 0}
		<option value="0" selected="selected">Nein</option>
		{else}
		<option value="0">Nein</option>
		{/if}
		</select></td>
	</tr>
	{/if}
	
	<tr>
		<td valign="top">Schreibe Betreffszeile um:</td>
		<td>{if $rewrite_subject == '1' } 
		<input type="radio" name="rewrite_subject"  value="0" /> Nein 
		<input type="radio" name="rewrite_subject" checked="checked" value="1" /> Ja<br />
		{else} 
		<input type="radio" checked="checked" name="rewrite_subject"  value="0" /> Nein 
		<input type="radio" name="rewrite_subject" value="1" /> Ja<br />
		{/if}
		<input id="spamassassin_subject_header"  maxlength="15" name="rewrite_subject_header" value="{$rewrite_subject_header}" type="text" />
		</td>
	</tr>
	
	<tr>
		<td>Markiere Nachricht als Spam ab:</td>
		<td><input type="text" id="spamassassin_threshold" name="threshold" value="{$threshold}" /></td>
	</tr>

	<tr>
		<td valign="top">Verschiebe erkannten Spam nach:</td>
		<td>{if $move_spam eq '0' } <input type="radio" name="move_spam" checked="checked" value="0" /> Nein 
		<input type="radio" name="move_spam"  value="1" /> Ja<br />
		{else} <input type="radio" name="move_spam"  value="0" /> Nein 
			<input type="radio" name="move_spam"  checked="checked" value="1" /> Ja <br />{/if}
		
		{if $imap_folder_exits == "1" }
		<select name="spam_folder">
		{foreach from=$available_folders item=row}
			{if $move_spam_folder == $row.name}
				<option value="{$row.name}" selected="selected">{$row.name_display}</option> 
			{else}
				<option value="{$row.name}">{$row.name_display}</option>
			{/if}
		{/foreach}</select>
		
		{else}<p>Kein Imap Ordner gefunden!<br/>Bitte Ordner im Mailprogramm anlegen!</p>
		{/if}
		
		{if $spamassassin_active eq '0' }
		<script type="text/javascript">
		cpves_sa_active('0');
		</script>
		{/if}
		<input name="save_option" type="submit" value="Speichern" /> 
		</td>
	</tr>
{*	
	<tr>
		<td colspan="2"><h2>Whitelist</h2></td>
	</tr>
	
	<tr>
		<td><h2>E-Mailadressen:</h2></td>
		<td><select name="whitelist[]" size="8" multiple="true">
		{section name=row loop=$whitelist}
			<option value="{$whitelist[row].email}">{$whitelist[row].email}	</option>
		{/section}</select></td>
	</tr>

	<tr>
		<td></td>
	</tr>
	
	
				<input type="submit" value="Markierte Adressen l&ouml;schen" />
			</td>
		<tr>
		<tr>
			<td>
				<h2>E-Mailadresse hinzuf&uuml;gen:</h2>
			</td>
			<td>
				<input type="text" name="white_add_email" value="" /> <input name="white_add" type="submit" value="Hinzuf&uuml;gen" /> 
			</td>
		<tr>
		<tr>
			<td colspan="2">
				<h2>Blacklist</h2>
			</td>
		<tr>
		<tr>
			<td>
				<h2>eMailadressen:</h2>
			</td>
			<td>
				<select name="blacklist[]" size="8" multiple="true">, {section name=row loop=$blacklist} 
					<option value="{$blacklist[row].email}">
						{$blacklist[row].email} 
					</option>
					{/section} </select> 
			</td>
		<tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="submit" value="Markierte Adressen l&ouml;schen" />
			</td>
		<tr>
		<tr>
			<td>
				<h2>eMailadresse hinzuf&uuml;gen:</h2>
			</td>
			<td>
				<input type="text" name="black_add_email" value="" /> <input name="blac_add" type="submit" value="Hinzuf&uuml;gen" /> 
			</td>
		<tr>
*}
</table>
</form>