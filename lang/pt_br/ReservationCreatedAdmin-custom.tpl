{*
Copyright 2011-2020 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}

Saudações!<br/><br/>

	<b>Detalhes da Reserva:</b>
	<br/>
	<br/>

	<b>Usuário:</b> {$UserName}<br/>
	<b>Inicio:</b> {formatdate date=$StartDate key=reservation_email}<br/>
	<b>Fim:</b> {formatdate date=$EndDate key=reservation_email}<br/>
	<b>Recurso:</b> {$ResourceName}<br/>

	{if $ResourceImage}
		<div class="resource-image"><img src="{$ScriptUrl}/{$ResourceImage}"/></div>
	{/if}

	<b>Título:</b> {$Title}<br/>
	<b>Descrição:</b> {$Description}<br/>

	{if count($RepeatDates) gt 0}
		<br/>
		A reserva ocorrerá nas seguintes datas:
		<br/>
	{/if}

	{foreach from=$RepeatDates item=date name=dates}
		{formatdate date=$date}<br/>
	{/foreach}

	{if $RequiresApproval}
		<br/>
		Um ou mais recursos necessitam de aprovação antes do seu uso. Essa reserva ficará pendente até que a mesma seja aprovada.
	{/if}

	<br/>
	<a href="{$ScriptUrl}/{$ReservationUrl}">Verifique a reserva</a> | <a href="{$ScriptUrl}">Acessar o Booked Scheduler</a>

<br/><br/>Atenciosamente,<br/><br/>

Diretoria Administrativa<br/>
UFAPE