{* -*-coding:utf-8-*-
Copyright 2011-2014 Nick Korbel

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
{include file='..\..\tpl\Email\emailheader.tpl'}

	予約の詳細:
	<br/>
	<br/>

	ユーザー: {$UserName}<br/>
	開始: {formatdate date=$StartDate key=reservation_email}<br/>
	終了: {formatdate date=$EndDate key=reservation_email}<br/>
	{if $ResourceNames|count > 1}
		リソース:<br/>
		{foreach from=$ResourceNames item=resourceName}
			{$resourceName}<br/>
		{/foreach}
		{else}
		リソース: {$ResourceName}<br/>
	{/if}
	件名: {$Title}<br/>
	説明: {$Description|nl2br}<br/>

	{if count($RepeatDates) gt 0}
		<br/>
		下記の日付の予約が取り消されました:
		<br/>
	{/if}

	{foreach from=$RepeatDates item=date name=dates}
		{formatdate date=$date}<br/>
	{/foreach}

	{if $Accessories|count > 0}
		<br/>備品:<br/>
		{foreach from=$Accessories item=accessory}
			({$accessory->QuantityReserved}) {$accessory->Name}<br/>
		{/foreach}
	{/if}

	<br/>
        <br/>
	<a href="{$ScriptUrl}">Booked Scheduler へログイン</a>

{include file='..\..\tpl\Email\emailfooter.tpl'}