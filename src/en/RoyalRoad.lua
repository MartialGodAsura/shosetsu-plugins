-- {"id":36833,"ver":"1.0.16","libVer":"1.0.0","author":"TechnoJo4","dep":["url>=1.0.0","CommonCSS>=1.0.0"]}

local baseURL = "https://www.royalroad.com"
local qs = Require("url").querystring

local css = Require("CommonCSS").table

-- LUA ARRAYS ONLY KNOW HOW TO COUNT FROM 0 or 1
local KEYWORD_FILTER_KEY = 099
local AUTHOR_FILTER_KEY = 100
local GENRES_FILTER_EXT = {"Action", "Adventure", "Comedy", "Contemporary", "Drama", "Fantasy", "Historical", "Horror", "Mystery", "Psychological", "Romance", "Satire", "Sci-fi", "Short Story", "Tragedy"}
local GENRES_FILTER_KEY = 200
local GENRES_FILTER_INT = { --individual, start from 1 to match ext
	[GENRES_FILTER_KEY+01] = "action",
	[GENRES_FILTER_KEY+02] = "adventure",
	[GENRES_FILTER_KEY+03] = "comedy",
	[GENRES_FILTER_KEY+04] = "contemporary",
	[GENRES_FILTER_KEY+05] = "drama",
	[GENRES_FILTER_KEY+06] = "fantasy",
	[GENRES_FILTER_KEY+07] = "historical",
	[GENRES_FILTER_KEY+08] = "horror",
	[GENRES_FILTER_KEY+09] = "mystery",
	[GENRES_FILTER_KEY+10] = "psychological",
	[GENRES_FILTER_KEY+11] = "romance",
	[GENRES_FILTER_KEY+12] = "satire",
	[GENRES_FILTER_KEY+13] = "sci_fi",
	[GENRES_FILTER_KEY+14] = "one_shot",
	[GENRES_FILTER_KEY+15] = "tragedy",
}
local TAGS_FILTER_EXT = {"Anti-Hero Lead", "Artificial Intelligence", "Attractive MC", "Cyberpunk", "Dungeon", "Dystopia", "Female Lead", "First Contact", "GameLit", "Gender Bender", "Genetically Engineered", "Grimdark", "Hard Sci-fi", "Harem", "High Fantasy", "LitRPG", "Loop", "Low Fantasy", "Magic", "Male Lead", "Martial Arts", "Multiple Lead Characters", "Mythos", "Non-Human lead", "Portal Fantasy / Isekai", "Post Apocalyptic", "Progression", "Reader interactive", "Reincarnation", "Ruling Class", "School Life", "Secret Identity", "Slice of Life", "Soft Sci-fi", "Space Opera", "Sports", "Steampunk", "Strategy", "Strong Lead", "Super Heroes", "Supernatural", "Technologically Engineered", "Time Travel", "Urban Fantasy", "Villainous Lead", "Virtual Reality", "War and Military", "Wuxia", "Xianxia"}
local TAGS_FILTER_KEY = 300
local TAGS_FILTER_INT = { --individual, start from 1 to match ext
	[TAGS_FILTER_KEY+01] = "anti-hero_lead",
	[TAGS_FILTER_KEY+02] = "Artificial_Intelligence",
	[TAGS_FILTER_KEY+03] = "attractive-mc",
	[TAGS_FILTER_KEY+04] = "cyberpunk",
	[TAGS_FILTER_KEY+05] = "dungeon",
	[TAGS_FILTER_KEY+06] = "Dystopia",
	[TAGS_FILTER_KEY+07] = "female_lead",
	[TAGS_FILTER_KEY+08] = "First_Contact",
	[TAGS_FILTER_KEY+09] = "gamelit",
	[TAGS_FILTER_KEY+10] = "gender_bender",
	[TAGS_FILTER_KEY+11] = "Genetically_Engineered",
	[TAGS_FILTER_KEY+12] = "grimdark",
	[TAGS_FILTER_KEY+13] = "Hard_Sci_fi",
	[TAGS_FILTER_KEY+14] = "harem",
	[TAGS_FILTER_KEY+15] = "high_fantasy",
	[TAGS_FILTER_KEY+16] = "litrpg",
	[TAGS_FILTER_KEY+17] = "Loop",
	[TAGS_FILTER_KEY+18] = "low_fantasy",
	[TAGS_FILTER_KEY+19] = "magic",
	[TAGS_FILTER_KEY+20] = "male_lead",
	[TAGS_FILTER_KEY+21] = "martial_arts",
	[TAGS_FILTER_KEY+22] = "multiple_lead",
	[TAGS_FILTER_KEY+23] = "mythos",
	[TAGS_FILTER_KEY+24] = "non-human_lead",
	[TAGS_FILTER_KEY+25] = "summoned_hero",
	[TAGS_FILTER_KEY+26] = "post_apocalyptic",
	[TAGS_FILTER_KEY+27] = "Progression",
	[TAGS_FILTER_KEY+28] = "reader_interactive",
	[TAGS_FILTER_KEY+29] = "reincarnation",
	[TAGS_FILTER_KEY+30] = "ruling_class",
	[TAGS_FILTER_KEY+31] = "school_life",
	[TAGS_FILTER_KEY+32] = "secret_identity",
	[TAGS_FILTER_KEY+33] = "slice_of_life",
	[TAGS_FILTER_KEY+34] = "Soft_Sci_fi",
	[TAGS_FILTER_KEY+35] = "space_opera",
	[TAGS_FILTER_KEY+36] = "sports",
	[TAGS_FILTER_KEY+37] = "steampunk",
	[TAGS_FILTER_KEY+38] = "strategy",
	[TAGS_FILTER_KEY+39] = "strong_lead",
	[TAGS_FILTER_KEY+40] = "super_heroes",
	[TAGS_FILTER_KEY+41] = "supernatural",
	[TAGS_FILTER_KEY+42] = "Technologically_Engineered",
	[TAGS_FILTER_KEY+43] = "Time_Travel",
	[TAGS_FILTER_KEY+44] = "urban_fantasy",
	[TAGS_FILTER_KEY+45] = "villainous_lead",
	[TAGS_FILTER_KEY+46] = "virtual_reality",
	[TAGS_FILTER_KEY+47] = "war_and_military",
	[TAGS_FILTER_KEY+48] = "wuxia",
	[TAGS_FILTER_KEY+49] = "xianxia",
}
local CONTENT_WARNINGS_FILTER_EXT = {"Profanity", "Sexual Content", "Gore", "Traumatising content"}
local CONTENT_WARNINGS_FILTER_KEY = 400
local CONTENT_WARNINGS_FILTER_INT = { --individual, start from 1 to match ext
	[CONTENT_WARNINGS_FILTER_KEY+1] = "profanity",
	[CONTENT_WARNINGS_FILTER_KEY+2] = "sexuality",
	[CONTENT_WARNINGS_FILTER_KEY+3] = "gore",
	[CONTENT_WARNINGS_FILTER_KEY+4] = "traumatising",
}
local PAGES_MIN_FILTER_KEY = 500
local PAGES_MAX_FILTER_KEY = 501
local RATING_MIN_FILTER_KEY = 502
local RATING_MAX_FILTER_KEY = 503
local STATUS_FILTER_EXT = {"ALL", "COMPLETED", "DROPPED", "ONGOING", "HIATUS", "STUB"}
local STATUS_FILTER_KEY = 600
local STATUS_FILTER_INT = { --individual, start from 1 to match ext
	[STATUS_FILTER_KEY+1] = "ALL",
	[STATUS_FILTER_KEY+2] = "COMPLETED",
	[STATUS_FILTER_KEY+3] = "DROPPED",
	[STATUS_FILTER_KEY+4] = "ONGOING",
	[STATUS_FILTER_KEY+5] = "HIATUS",
	[STATUS_FILTER_KEY+6] = "STUB",
}
local ORDER_BY_FILTER_EXT = {"Relevance", "Popularity", "Average Rating", "Last Update", "Release Date", "Followers", "Number of Pages", "Views", "Title"}
local ORDER_BY_FILTER_KEY = 700
local ORDER_BY_FILTER_INT = { --dropdown, start from 0
	[0] = "relevance",
	"popularity",
	"rating",
	"last_update",
	"release_date",
	"followers",
	"length",
	"views",
	"title",
}
local ORDER_FILTER_KEY = 800
local TYPE_FILTER_EXT = {"All", "Fan Fiction", "Original"}
local TYPE_FILTER_KEY = 900
local TYPE_FILTER_INT = { --dropdown, start from 0
	[0] = "all",
	"fanfiction",
	"original",
}

local function shrinkURL(url, t)
	if t == 1 then -- novel url
		url = url:match("/fiction/(%d+)")
	else
		url = url:gsub("^.-royalroad%.com/?", "")
	end
	return url
end

local function expandURL(url, t)
	url = (url:sub(1, 1) == "/" and "" or "/") .. url
	if t == 1 then -- novel url
		url = "/fiction" .. url
	end
	return baseURL .. url
end

local function TriStateFilter_(int, str)
	if TriStateFilter then
		return TriStateFilter(int, str)
	else
		return CheckboxFilter(int, str)
	end
end

local function MultiTriStateFilter(offset, filter_ext, stop)
	local f={}
	for i=1,stop do
		f[#f+1] = TriStateFilter_(offset+i, filter_ext[i])
	end
	return f
end

local function createFilterString(data)
	local function emptyNil(str)
		if str == "" then
			return nil
		end
		return str
	end

	local statuses = {}
	for i=1,#STATUS_FILTER_EXT do
		if data[STATUS_FILTER_KEY+i] then
			statuses[#statuses+1] = STATUS_FILTER_INT[STATUS_FILTER_KEY+i]
		end
	end
	
	local order
	if data[ORDER_BY_FILTER_KEY] ~= 0 then
		order = ORDER_BY_FILTER_INT[data[ORDER_BY_FILTER_KEY]]
	end
	
	local dir
	if data[ORDER_FILTER_KEY] then
		dir = "asc"
	end
	
	local type
	if data[TYPE_FILTER_KEY] ~= 0 then
		type = TYPE_FILTER_INT[data[TYPE_FILTER_KEY]]
	end
	
	local tagsAdd, tagsRemove = {}, {}
	local function MultiTriQuery(strings, start, len)
		for i=start+1,start+len do
			if data[i] then
				if (data[i] == 2) then
					tagsRemove[#tagsRemove+1] = strings[i]
				elseif (data[i] == 1) then
					tagsAdd[#tagsAdd+1] = strings[i]
				end
			end
		end
	end
	
	MultiTriQuery(GENRES_FILTER_INT, GENRES_FILTER_KEY, #GENRES_FILTER_EXT)
	MultiTriQuery(TAGS_FILTER_INT, TAGS_FILTER_KEY, #TAGS_FILTER_EXT)
	MultiTriQuery(CONTENT_WARNINGS_FILTER_INT, CONTENT_WARNINGS_FILTER_KEY, #CONTENT_WARNINGS_FILTER_EXT)
	
	return "?"..qs({
		title = data[QUERY],
		keyword = emptyNil(data[KEYWORD_FILTER_KEY]),
		author = emptyNil(data[AUTHOR_FILTER_KEY]),
		minPages = emptyNil(data[PAGES_MIN_FILTER_KEY]),
		maxPages = emptyNil(data[PAGES_MAX_FILTER_KEY]),
		minRating = emptyNil(data[RATING_MIN_FILTER_KEY]),
		maxRating = emptyNil(data[RATING_MAX_FILTER_KEY]),
		status = statuses,
		orderBy = order,
		dir = dir,
		tagsAdd = tagsAdd,
		tagsRemove = tagsRemove,
		page = data[PAGE]
	})
end

local function parseListing(doc)
	local results = doc:selectFirst(".fiction-list")

	return mapNotNil(results:children(), function(v)
		local a = v:selectFirst(".fiction-title a")
		--No results matching these criteria were found
		if a then
			return Novel {
				title = a:text(),
				link = a:attr("href"):match("/fiction/(%d+)/.-"),
				imageURL = v:selectFirst("a img"):attr("src")
			}
		end
	end)
end

local function listing(name, inc, url)
	url = expandURL(url)
	return Listing(name, inc, function(data)
		-- ?genre= (instead of ?tagsAdd=) is the only working listing filter,
		-- so if any filter is used, switch from listing to search
		local filterstring = createFilterString(data)
		if filterstring ~= "?" then
			url = expandURL("/fictions/search")
			inc = false --don't crash the site
		end
		return parseListing(GETDocument(url..filterstring..(inc and "&page="..data[PAGE] or "")))
	end)
end

local styleKeep = {
	["text-decoration"] = true
}

return {
	id = 36833,
	name = "RoyalRoad",
	baseURL = baseURL,
	imageURL = "https://github.com/shosetsuorg/extensions/raw/dev/icons/RoyalRoad.png",
	chapterType = ChapterType.HTML,

	listings = {
		listing("Best Rated", true, "fictions/best-rated"),
		listing("Trending", false, "fictions/trending"),
		listing("Ongoing", true, "fictions/active-popular"),
		listing("Complete", true, "fictions/complete"),
		listing("Popular Weekly", true, "fictions/weekly-popular"),
		listing("Latest Updates", true, "fictions/latest-updates"),
		listing("New Releases", true, "fictions/new-releases"),
		listing("Rising Stars", false, "fictions/rising-stars")
	},

	shrinkURL = shrinkURL,
	expandURL = expandURL,

	parseNovel = function(url, loadChapters)
		local doc = GETDocument(baseURL.."/fiction/"..url.."/a")

		local page = doc:selectFirst(".page-content-inner")
		local header = page:selectFirst(".fic-header")
		local title = header:selectFirst(".fic-title")
		local info = page:selectFirst(".fiction-info")
		local type_status_genrestags = info:selectFirst(".margin-bottom-10")
		local novel_type = type_status_genrestags:selectFirst(".label")
		local genres_tags = type_status_genrestags:selectFirst(".tags")
		local content_warnings = info:selectFirst(".text-center")

		local s = mapNotNil(type_status_genrestags:select(":nth-child(2)"), function(v)
			local text = v:ownText()
			if text == "" or text ~= text:upper() then
				return
			end
			return text
		end)[1]

		s = s and ({
			COMPLETED = NovelStatus.COMPLETED,
			--DROPPED = NovelStatus.DROPPED,
			ONGOING = NovelStatus.PUBLISHING,
			HIATUS = NovelStatus.PAUSED,
			--STUB = NovelStatus.STUB,
		})[s] or NovelStatus.UNKNOWN

		local function tablecontains(t, e)
			for _, v in ipairs(t) do
				if e == v then
					return true
				end
			end
			return false
		end

		local genres = {}
		local tags = {}
		table.insert(tags, novel_type:text())
		mapNotNil(genres_tags:select("a"), function(a)
			local genre_tag = a:text()
			if tablecontains(GENRES_FILTER_EXT, genre_tag) then
				table.insert(genres, genre_tag)
			else
				table.insert(tags, genre_tag)
			end
		end)
		mapNotNil(content_warnings:select("li"), function(cw)
			table.insert(tags, cw:text())
		end)

		local function trim(s)
			return s:match("^%s*(.-)%s*$")
		end

		local function HTMLToString(text)
			text = text:gsub(">%s+<", "><")
			text = text:gsub("&nbsp;", " ")

			local brTag = "%s*<[Bb][Rr]%s*(/?)%s*>%s*"
			local pattern2 = brTag .. brTag .. "(" .. brTag .. ")*"

			text = text:gsub(pattern2, "[[BRBR]]")
			text = text:gsub(brTag, "\n")
			text = text:gsub("</[Pp]>", "\n\n")

			local hrTag = "%s*<[Hh][Rr][^>]*>%s*"
			text = text:gsub(hrTag, "\n\n---\n\n")

			text = text:gsub("<[^>]+>", "")

			text = text:gsub("%[%[BRBR%]%]", "\n\n")
			text = text:gsub("\n*%-%-%-%\n*", "\n\n---\n\n")

			local lines = {}
			for line in (text .. "\n"):gmatch("(.-)\n") do
				table.insert(lines, trim(line))
			end
			text = table.concat(lines, "\n")
			text = trim(text)

			return text
		end

		local description = HTMLToString(tostring(info:selectFirst(".description .hidden-content")))

		local text = function(v) return v:text() end
		local novel = NovelInfo {
			title = title:selectFirst("h1"):text(),
			imageURL = header:selectFirst("img"):attr("src"),
			description = description,
			genres = genres,
			tags = tags,
			authors = { title:selectFirst("h4 a"):text() },
			status = s
		}

		if loadChapters then
			local i = 0
			novel:setChapters(AsList(map(doc:selectFirst("#chapters tbody"):children(), function(v)
				local a = v:selectFirst("a")
				local a_time = v:selectFirst("time")
				i = i + 1
				return NovelChapter {
					order = i,
					title = a:text(),
					link = a:attr("href"),
					release = (a_time and (a_time:attr("title") or a_time:attr("unixtime") or v:selectLast("a"):text())) or nil
				}
			end)))
		end

		return novel
	end,

	getPassage = function(url)
		local chap = GETDocument(expandURL(url))
		local head = chap:selectFirst("head")
		chap = chap:selectFirst(".chapter-page")
		local title = chap:selectFirst(".fic-header h1"):text()
		chap = chap:selectFirst(".chapter-content")

		-- insert title at start of chapter
		chap:prepend("<h1>" .. title .. "</h1>")

		-- find hidden paragraphs

		local hiddenClasses = {}
		head:traverse(NodeVisitor(function(v)
			local tag = tostring(v)
			if v:tagName() == "style" and tag:find("display: none") then
				-- get the class name
				local class = string.sub(tag,tag:find("%.%w+{"))
				-- add it to the list, removing the { and .
				class = string.gsub(class,"[%.{]","")
				hiddenClasses[#hiddenClasses+1] = class
			end
		end))


		-- remove empty paragraphs & forced paragraph indents
		local toRemove = {}
		chap:traverse(NodeVisitor(function(v)
			-- remove hidden paragraphs (pirating warnings)
			for _, x in ipairs(hiddenClasses) do
				if v:attr("class")== x then
					toRemove[#toRemove+1] = v
				end
			end
			-- remove whitespace at the start of the paragraph
			if v:tagName() == "p" or (v:parent():tagName() == "p" and v:elementSiblingIndex() == 0) then
				local nodes = v:textNodes()
				print(nodes)
				if not nodes:isEmpty() then
					local tn = nodes:get(0)
					local o = tn:text()
					local s = o:gsub("^[ \n ]+", "")

					if s == "" and nodes:size() == 1 then
						toRemove[#toRemove+1] = v
					elseif o ~= s then
						tn:text(s)
					end
				end
			end

			if v:hasAttr("border") then
				v:removeAttr("border")
			end

			if v:hasAttr("align") then
				v:removeAttr("align")
			end

			-- manually remove all style attributes except the useful ones
			-- TODO: if this becomes useful for other extensions, move this to a lib
			if v:hasAttr("style") then
				local s = ""
				for k,v in (v:attr("style")..";"):gmatch("(.-):%s*(.-);%s*") do
					if styleKeep[k] then
						s = s .. k .. ":" .. v .. ";"
					end
				end
				if s == "" then
					v:removeAttr("style")
				else
					v:attr("style", s)
				end
			end
		end, nil, true))

		for _,v in pairs(toRemove) do
			v:remove()
		end

		-- insert author notes
		local noteTitleStyle = "text-transform:uppercase;font-weight:700"
		map(chap:previousElementSiblings(), function(v)
			if v:hasClass("author-note-portlet") then
				v:selectFirst(".portlet-title"):attr("style", noteTitleStyle)
				chap:prepend("<hr>")
				chap:prepend(v)
			end
		end)

		map(chap:nextElementSiblings(), function(v)
			if v:hasClass("author-note-portlet") then
				v:selectFirst(".portlet-title"):attr("style", noteTitleStyle)
				chap:append("<hr>")
				chap:append(v)
			end
		end)

		return pageOfElem(chap, false, css)
	end,

	search = function(data)
		return parseListing(GETDocument(baseURL .. "/fictions/search" .. createFilterString(data)))
	end,
	isSearchIncrementing = false,
	searchFilters = {
		TextFilter(KEYWORD_FILTER_KEY, "Keyword (title or description)"),
		TextFilter(AUTHOR_FILTER_KEY, "Author name"),
		FilterGroup("Genres", MultiTriStateFilter(GENRES_FILTER_KEY, GENRES_FILTER_EXT, #GENRES_FILTER_EXT)),
		FilterGroup("Additional Tags", MultiTriStateFilter(TAGS_FILTER_KEY, TAGS_FILTER_EXT, #TAGS_FILTER_EXT)),
		FilterGroup("Content Warnings", MultiTriStateFilter(CONTENT_WARNINGS_FILTER_KEY, CONTENT_WARNINGS_FILTER_EXT, #CONTENT_WARNINGS_FILTER_EXT)),
		TextFilter(PAGES_MIN_FILTER_KEY, "Number of Pages min 0"), --todo number slider/selector
		TextFilter(PAGES_MAX_FILTER_KEY, "Number of Pages max 20000"),
		TextFilter(RATING_MIN_FILTER_KEY, "Rating min 0.0"),
		TextFilter(RATING_MAX_FILTER_KEY, "Rating max 5.0"),
		FilterGroup("Status", {
			CheckboxFilter(601, STATUS_FILTER_EXT[01]),
			CheckboxFilter(602, STATUS_FILTER_EXT[02]),
			CheckboxFilter(603, STATUS_FILTER_EXT[03]),
			CheckboxFilter(604, STATUS_FILTER_EXT[04]),
			CheckboxFilter(605, STATUS_FILTER_EXT[05]),
			CheckboxFilter(606, STATUS_FILTER_EXT[06]),
		}),
		DropdownFilter(ORDER_BY_FILTER_KEY, "Order by", ORDER_BY_FILTER_EXT),
		SwitchFilter(ORDER_FILTER_KEY, "Descending / Ascending"),
		DropdownFilter(TYPE_FILTER_KEY, "Type", TYPE_FILTER_EXT),
	},
}
