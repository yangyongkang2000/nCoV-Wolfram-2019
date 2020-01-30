Module[{Data = 
   CloudGet[CloudObjects["https://wolfr.am/JXRppoDB"]], HubeiData, HubeiCityName, ConfirmedCount, 
  HubeiCityConfirmedCount, 
  ProvinceName = {Entity[
     "AdministrativeDivision", {"Hubei", "China"}], 
    Entity["AdministrativeDivision", {"Zhejiang", "China"}], 
    Entity["AdministrativeDivision", {"Guangdong", "China"}], 
    Entity["AdministrativeDivision", {"Hunan", "China"}], 
    Entity["AdministrativeDivision", {"Henan", "China"}], 
    Entity["AdministrativeDivision", {"Anhui", "China"}], 
    Entity["AdministrativeDivision", {"Chongqing", "China"}], 
    Entity["AdministrativeDivision", {"Shandong", "China"}], 
    Entity["AdministrativeDivision", {"Jiangxi", "China"}], 
    Entity["AdministrativeDivision", {"Sichuan", "China"}], 
    Entity["AdministrativeDivision", {"Jiangsu", "China"}], 
    Entity["AdministrativeDivision", {"Beijing", "China"}], 
    Entity["AdministrativeDivision", {"Fujian", "China"}], 
    Entity["AdministrativeDivision", {"Shanghai", "China"}], 
    Entity["AdministrativeDivision", {"Guangxi", "China"}], 
    Entity["AdministrativeDivision", {"Shaanxi", "China"}], 
    Entity["AdministrativeDivision", {"Hebei", "China"}], 
    Entity["AdministrativeDivision", {"Yunnan", "China"}], 
    Entity["AdministrativeDivision", {"Hainan", "China"}], 
    Entity["AdministrativeDivision", {"Heilongjiang", "China"}], 
    Entity["AdministrativeDivision", {"Liaoning", "China"}], 
    Entity["AdministrativeDivision", {"Shanxi", "China"}], 
    Entity["AdministrativeDivision", {"Tianjin", "China"}], 
    Entity["AdministrativeDivision", {"Gansu", "China"}], 
    Entity["AdministrativeDivision", {"Neimenggu", "China"}], 
    Entity["AdministrativeDivision", {"Xinjiang", "China"}], 
    Entity["AdministrativeDivision", {"Ningxia", "China"}], 
    Entity["AdministrativeDivision", {"Guizhou", "China"}], 
    Entity["AdministrativeDivision", {"Jilin", "China"}], 
    Entity["Country", "Taiwan"], 
    Entity["City", {"HongKong", "HongKong", "HongKong"}], 
    Entity["Country", "Macau"], 
    Entity["AdministrativeDivision", {"Qinghai", "China"}], 
    Entity["AdministrativeDivision", {"Xizang", "China"}]}, p1, p2, 
  p3, p4}, ConfirmedCount = ("confirmedCount" /. Data[[3 ;; -1]]); 
 HubeiData = ("cities" /. Data[[3]]); 
 HubeiCityName = "cityName" /. HubeiData; 
 HubeiCityConfirmedCount = "confirmedCount" /. HubeiData; 
 p1 = ParallelTable[
   BarChart[#[[k]] & /@ HubeiCityConfirmedCount, 
    ChartLabels -> HubeiCityName, 
    ColorFunction -> Function[{height}, ColorData["Rainbow"][height]],
     PlotRange -> {0, 2300}], {k, 1, 7}]; 
 p2 = ListLinePlot[HubeiCityConfirmedCount, Mesh -> All, 
   PlotLegends -> HubeiCityName, PlotTheme -> "Marketing", 
   PlotRange -> {0, 1000}]; 
 p3 = BarChart[#[[-1]] & /@ ConfirmedCount, 
   ColorFunction -> Function[{height}, ColorData["Rainbow"][height]]];
  p4 = Table[
   GeoRegionValuePlot[
    ProvinceName[[#]] -> ConfirmedCount[[#]][[k]] & /@ Range[17], 
    PlotRange -> {1, 999}, ColorFunction -> "Rainbow", 
    GeoLabels -> True], {k, 1, 7}]; 
 Table[GeoBubbleChart[
   ProvinceName[[#]] -> ConfirmedCount[[#]][[k]] & /@ Range[17], 
   GeoBackground -> "Satellite", ColorFunction -> "Rainbow"], {k, 1, 
   7}]]
