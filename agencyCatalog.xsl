<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" />
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Туристическа агенция</title>
				<link rel="stylesheet" type="text/css" href="style.css" />
				<script type="text/javascript" src="js.js"></script>
				
				
			</head>
			<body onload="main()">
				<h1>Туристическа агенция "Ери"</h1>
					
					<div class="menu">
						<a href="#" onclick="main()">Начало</a>
						
						<div class="dropdown">
							<button class="btn" onclick="showBulgaria()">България</button>
							<div class="dropdown-content">
								<a href="#" onclick="showBansko()">Банско</a>
								<a href="#" onclick="showHisarq()">Хисаря</a>
								<a href="#" onclick="showLeshten()">Лещен</a>
							</div>
						</div>
						
						<div class="dropdown">
							<button class="btn" onclick="showAbroad()">Чужбина</button>
							<div class="dropdown-content">
								<a href="#" onclick="showGreece()">Гърция</a>
								<a href="#" onclick="showSpain()">Испания</a>
								<a href="#" onclick="showMexico()">Мексико</a>
							</div>
						</div>
						
						<a href="#" onclick="showLists()">Списъци на пътниците</a>
						
					</div>
					
					<div class="sort">
						<select name="sort" id="sort" onchange="newSelection()">
							<option value="excursionContainer">Сортирай</option>
							<option value="excursionDescendingContainer">Цена низходяща</option>
							<option value="excursionAscendingContainer">Цена възходяща</option>
							<option value="excursionNameSortContainer">По име</option>
						</select>
					</div>
					
					<xsl:apply-templates />
					
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='all']">
		<div id="excursionContainer">
			<xsl:for-each select="/agency/catalog/excursion">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='sortedAscending']">
		<div id="excursionAscendingContainer">
			<xsl:for-each select="/agency/catalog/excursion">
			
				<xsl:sort
					select = "price"
					data-type="number"
					order = "ascending">
				</xsl:sort>
			
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='sortedDescending']">
		<div id="excursionDescendingContainer">
			<xsl:for-each select="/agency/catalog/excursion">
			
				<xsl:sort
					select = "price"
					data-type="number"
					order = "descending">
				</xsl:sort>
			
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='nameSorted']">
		<div id="excursionNameSortContainer">
			<xsl:for-each select="/agency/catalog/excursion">
				
				<xsl:sort
					select = "name"
					data-type="text">
				</xsl:sort>
			
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='greece']">
		<div id="GreeceContainer">
			<xsl:for-each select="/agency/catalog/excursion[@countryId=2]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='spain']">
		<div id="SpainContainer">
			<xsl:for-each select="/agency/catalog/excursion[@countryId=3]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='mexico']">
		<div id="MexicoContainer">
			<xsl:for-each select="/agency/catalog/excursion[@countryId=4]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='bansko']">
		<div id="BanskoContainer">
			<xsl:for-each select="/agency/catalog/excursion[@regionId=1]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='hisarq']">
		<div id="HisarqContainer">
			<xsl:for-each select="/agency/catalog/excursion[@regionId=2]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/catalog[@id='leshten']">
		<div id="LeshtenContainer">
			<xsl:for-each select="/agency/catalog/excursion[@regionId=3]">
				<div class="excursionInfo">
					<p id="excName"><xsl:value-of select="name" /></p>
					<p class="img"><img src="img/{@id}.jpg" /></p>
					<ul id="info">
						<li id="country">Държава: <xsl:value-of select="/agency/countryList/country[@id=current()/@countryId]/@name" /></li>
						<li id="region">Регион: <xsl:value-of select="/agency/regionList/region[@id=current()/@regionId]/@name" /></li>
						<li id="desc">Описание: <xsl:value-of select="description" /></li>
						<li id="dest">Дестинация: <xsl:value-of select="destination" /></li>
						<li id="dates">Дати:
							<ul>
								<xsl:for-each select="dates/date">
									<li><xsl:value-of select="." /></li>
								</xsl:for-each>
							</ul>
						</li>
						<li id="price">Цена: <xsl:value-of select="price" /> лв.</li>
						<li id="program">Туристическа програма: <xsl:value-of select="touristProgram" /></li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
	<xsl:template match="/agency/passangersList">
		<div id="passangersContainer">
			<xsl:for-each select="/agency/catalog/excursion">
				<h3><xsl:value-of select="name" /></h3>
				<xsl:variable name="excId" select="@id" />
				<xsl:for-each select="dates/date">
					<h5><xsl:value-of select="." /></h5>
					<xsl:variable name="date" select="." />
					<ul>
						<xsl:for-each select="/agency/passangersList/passanger[excursionId=$excId and excDate=$date]">
							<li><xsl:value-of select="firstName" />&#160;<xsl:value-of select="lastName" /></li>
						</xsl:for-each>
					</ul>
				</xsl:for-each>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	
</xsl:stylesheet>