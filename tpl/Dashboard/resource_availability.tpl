{*
Copyright 2017-2020 Nick Korbel

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

<div class="dashboard dashboard availabilityDashboard default-box col-xs-12 col-sm-8 col-sm-offset-2 dashboardCaixa" id="availabilityDashboard">
    <div class="dashboardHeader">
        <div class="pull-left dashboardTitulo">{translate key="ResourceAvailability"}</div>
        <div class="pull-right">
            <a href="#" title="{translate key=ShowHide} {translate key="ResourceAvailability"}">
                <i class="glyphicon"></i>
                <span class="no-show">Expand/Collapse</span>
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <hr>
    <div class="dashboardContents">
        <div class="header dashboardDisponivel">{translate key=Available}</div>
        {foreach from=$Schedules item=s}
            {assign var=availability value=$Available[$s->GetId()]}
            {if is_array($availability) && $availability|count > 0}
            <h5 id="dashboardH5">{$s->GetName()}</h5>
            {foreach from=$availability item=i}
                <button class="availabilityItem dashboardDisponivelBotao" disabled>
                    <div class="col-xs-12 col-sm-4 dashboardTituloReserva">
                        <i resource-id="{$i->ResourceId()}" class="resourceNameSelector fa fa-circle"></i>
                        <div class="resourceName" style="background-color:{$i->GetColor()};color:{$i->GetTextColor()};">
                            <a href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}"
                               resource-id="{$i->ResourceId()}"
                               class="resourceNameSelector" style="color:{$i->GetTextColor()}">{$i->ResourceName()}</a>
                        </div>
                    </div>
                    <div class="availability col-xs-12 col-sm-4">
                        {if $i->NextTime() != null}
                            <span class="no-data">{translate key=AvailableUntil}
                            {format_date date=$i->NextTime() timezone=$Timezone key=dashboard}</span>
                        {else}
                            <span class="no-data">{translate key=AllNoUpcomingReservations args=30}</span>
                        {/if}
                    </div>
                    <div class="reserveButton col-xs-12 col-sm-4">
                        <a class="btn btn-primary btn-xs col-xs-12 reservarBotao"
                           href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}">{translate key=Reserve}</a>
                    </div>
                    <div class="clearfix"></div>
                </button>
                {foreachelse}
                <div class="no-data">{translate key=None}</div>
            {/foreach}
            {/if}
        {/foreach}

        <div class="header">{translate key=Unavailable}</div>

        {foreach from=$Schedules item=s}
            {assign var=availability value=$Unavailable[$s->GetId()]}
            {if is_array($availability) && $availability|count > 0}
            <h5>{$s->GetName()}</h5>
            {foreach from=$availability item=i}
                <button class="availabilityItem dashboardDisponivelBotao" disabled>
                    <div class="col-xs-12 col-sm-4 dashboardTituloReserva">       
                        <i resource-id="{$i->ResourceId()}" class="resourceNameSelector fa fa-circle"></i>                 
                        <div class="resourceName" style="background-color:{$i->GetColor()};color:{$i->GetTextColor()};">
                            <a href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}"
                               resource-id="{$i->ResourceId()}"
                               class="resourceNameSelector" style="color:{$i->GetTextColor()}">{$i->ResourceName()}</a>
                        </div>
                    </div>
                    <div class="availability col-xs-12 col-sm-4">
                        <span class="no-data">{translate key=AvailableBeginningAt} {format_date date=$i->ReservationEnds() timezone=$Timezone key=dashboard}</span>
                    </div>
                    <div class="reserveButton col-xs-12 col-sm-4">
                        <a class="btn btn-xs col-xs-12 reservarBotao"
                           href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}&{QueryStringKeys::START_DATE}={format_date date=$i->ReservationEnds() timezone=$Timezone key=url_full}">{translate key=Reserve}</a>
                    </div>
                </button>
                <div class="clearfix"></div>
                {foreachelse}
                <div class="no-data">{translate key=None}</div>
            {/foreach}
            {/if}
        {/foreach}

        <div class="header">{translate key=UnavailableAllDay}</div>
        {foreach from=$Schedules item=s}
            {assign var=availability value=$UnavailableAllDay[$s->GetId()]}
            {if is_array($availability) && $availability|count > 0}
            <h5>{$s->GetName()}</h5>
            {foreach from=$availability item=i}
                <button class="availabilityItem dashboardDisponivelBotao" disabled>
                    <div class="col-xs-12 col-sm-4 dashboardTituloReserva">
                        <i resource-id="{$i->ResourceId()}" class="resourceNameSelector fa fa-info-circle"></i>
                        <div class="resourceName" style="background-color:{$i->GetColor()};color:{$i->GetTextColor()};">
                            <a href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}"
                               resource-id="{$i->ResourceId()}"
                               class="resourceNameSelector" style="color:{$i->GetTextColor()}">{$i->ResourceName()}</a>
                        </div>
                    </div>
                    <div class="availability col-xs-12 col-sm-4">
                        <span class="no-data">{translate key=AvailableAt} {format_date date=$i->ReservationEnds() timezone=$Timezone key=dashboard}</span>
                    </div>
                    <div class="reserveButton col-xs-12 col-sm-4">
                        <a class="btn btn-xs col-xs-12 reservarBotao"
                           href="{$Path}{Pages::RESERVATION}?{QueryStringKeys::RESOURCE_ID}={$i->ResourceId()}&{QueryStringKeys::START_DATE}={format_date date=$i->ReservationEnds() timezone=$Timezone key=url_full}">{translate key=Reserve}</a>
                    </div>
                </button>
                <div class="clearfix"></div>
                {foreachelse}
                <div class="no-data">{translate key=None}</div>
            {/foreach}
            {/if}
        {/foreach}
    </div>
</div>