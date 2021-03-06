<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:451px;top:251px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dList" concept="OA_SD_Schedule"> 
      <reader xid="default1" action="/OA/schedule/logic/action/querySDSCHEDULEAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dSchedule" concept="OA_SD_Schedule"> 
      <reader xid="default4" action="/OA/schedule/logic/action/querySDSCHEDULEAction"/>  
      <writer xid="default5" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default6" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dPerson" concept="V_SA_OPPerson" onIndexChanged="dPersonIndexChanged"> 
      <reader xid="default7" action="/OA/common/logic/action/querySAOPPersonAction"/> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-3" xid="col1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="dPerson" filterCols="sName,sMainOrgFName"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/>  
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="personList" data="dPerson"> 
          <columns xid="columns2"> 
            <column name="sName" xid="column3"/>  
            <column name="sMainOrgFName" xid="column4" label="所属机构"/> 
          </columns> 
        </div> 
      </div>  
      <div class="col col-xs-9" xid="col2"> 
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
          <ul class="nav nav-tabs" xid="ul1"> 
            <li class="active" xid="scheduleTab" bind-click="li1Click"> 
              <a content="tabContent1" xid="tabItem1"><![CDATA[日程]]></a> 
            </li>  
            <li role="presentation" xid="listTab" bind-click="listTabClick"> 
              <a content="tabContent2" xid="tabItem2"><![CDATA[列表]]></a> 
            </li> 
          </ul>  
          <div class="tab-content" xid="div1"> 
            <div class="tab-pane active" xid="tabContent1"> 
              <div component="$UI/system/components/justep/bar/bar" class="x-bar"
                xid="bar1" style="background-color:white;"> 
                <div component="$UI/system/components/justep/button/buttonGroup"
                  class="btn-group btn-group-sm" tabbed="true" xid="viewTypeButtonGroup"
                  selected="weekBtn"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" label="月" xid="monthBtn" onClick="monthBtnClick"> 
                    <i xid="i1"/>  
                    <span xid="span1">月</span> 
                  </a>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" label="周" xid="weekBtn" onClick="weekBtnClick"> 
                    <i xid="i2"/>  
                    <span xid="span2">周</span> 
                  </a>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" label="天" xid="dayBtn" onClick="dayBtnClick"> 
                    <i xid="i3"/>  
                    <span xid="span3">天</span> 
                  </a> 
                </div>  
                <div style="flex:1"> 
                  <div component="$UI/system/components/justep/button/buttonGroup"
                    class="btn-group btn-group-sm pull-right" tabbed="false" xid="viewTypeButtonGroup"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" xid="prevBtn" onClick="prevBtnClick"
                      icon="icon-chevron-left"> 
                      <i xid="i8" class="icon-chevron-left"/>  
                      <span xid="span6"/> 
                    </a>  
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="今天" xid="todaybtn" onClick="todayBtnClick"> 
                      <i xid="i9"/>  
                      <span xid="span7">今天</span> 
                    </a>  
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" xid="nextBtn" onClick="nextBtnClick"
                      icon="icon-chevron-right"> 
                      <i xid="i10" class="icon-chevron-right"/>  
                      <span xid="span10"/> 
                    </a> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="week" day="now" firstDay="sunday" lunarDay="false" xid="calendar"
                timeStart="00:00" timeEnd="23:00" timeSplit="60" onEventsLoad="calendarEventsLoad"/> 
            </div>  
            <div class="tab-pane" xid="tabContent2"> 
              <div component="$UI/system/components/justep/toolBar/toolBar"
                class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" onClick="{'operation':'dList.refresh'}"
                  xid="button4"> 
                  <i xid="i7"/>  
                  <span xid="span9"/> 
                </a>  
                <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
                  xid="triSee" filterData="dList" filterMode="dateRange" beginDateCol="fBeginTime"
                  endDateCol="fEndTime" defaultValue="thisWeek" options="all,today,yesterday,thisWeek,lastWeek,thisMonth,lastMonth,thisYear,lastYear,custom"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="gridSelect1"> 
                    <option xid="option1"/>
                  </div> 
                </div>  
                <div class="input-group pull-right" component="$UI/system/components/justep/smartFilter/smartFilter"
                  xid="smartFilter1" filterData="dList" filterCols="OA_SD_Schedule,version,fTitle,fBeginDatePart,fBeginTimePart,fBeginTime,fEndDatePart,fEndTimePart,fEndTime,fContent,fExecutors,fIsShared,fIsRemind,fRemindDatePart,fRemindTimePart,fRemindTime,fCreatePsnID,fCreatePsnName,fCreateTime,fCreateURL,fBizID,fBizType"> 
                  <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
                    xid="span17"> 
                    <i class="icon-android-search" xid="i11"/>
                  </span>  
                  <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                    bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                    xid="input1"/>  
                  <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
                    bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
                    xid="span18"> 
                    <i class="icon-close-circled" xid="i12"/>
                  </span> 
                </div>
              </div>  
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                xid="dataTables1" data="dList" onRowDblClick="gotoDetail"> 
                <columns xid="columns1"> 
                  <column name="fTitle" xid="column1" label="日程主题"/>  
                  <column name="fBeginTime" xid="column2" label="开始时间"/>  
                  <column name="fEndTime" xid="column3" label="结束时间"/>  
                  <column name="fCreatePsnName" xid="column5" label="创建人"/>  
                  <column name="fCreateTime" xid="column6" label="创建时间"/> 
                </columns> 
              </div>  
              <div component="$UI/system/components/justep/pagerBar/pagerBar"
                class="x-pagerbar container-fluid" xid="pagerBar1" data="dList"> 
                <div class="row" xid="div2"> 
                  <div class="col-sm-3" xid="div3"> 
                    <div class="x-pagerbar-length" xid="div4"> 
                      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                        class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                        <span xid="span11">显示</span>  
                        <select component="$UI/system/components/justep/select/select"
                          class="form-control input-sm" xid="select1"> 
                          <option value="10" xid="default7">10</option>  
                          <option value="20" xid="default8">20</option>  
                          <option value="50" xid="default9">50</option>  
                          <option value="100" xid="default10">100</option> 
                        </select>  
                        <span xid="span12">条</span> 
                      </label> 
                    </div> 
                  </div>  
                  <div class="col-sm-3" xid="div5"> 
                    <div class="x-pagerbar-info" xid="div6">当前显示0条，共0条</div> 
                  </div>  
                  <div class="col-sm-6" xid="div7"> 
                    <div class="x-pagerbar-pagination" xid="div8"> 
                      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                        xid="pagination1"> 
                        <li class="prev" xid="li3"> 
                          <a href="#" xid="a1"> 
                            <span aria-hidden="true" xid="span13">«</span>  
                            <span class="sr-only" xid="span14">Previous</span> 
                          </a> 
                        </li>  
                        <li class="next" xid="li4"> 
                          <a href="#" xid="a2"> 
                            <span aria-hidden="true" xid="span15">»</span>  
                            <span class="sr-only" xid="span16">Next</span> 
                          </a> 
                        </li> 
                      </ul> 
                    </div> 
                  </div> 
                </div> 
              </div>
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
