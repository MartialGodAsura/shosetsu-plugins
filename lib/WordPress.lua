function GetChapters()
    for chapter in dom.SelectElements(".wp-manga-chapter a") do
        local url = chapter.SelectValue("@href")
        local title = chapter.SelectValue("text()")
        chapters.Add(url, title)
    end
    chapters.Reverse()
end

function GetInfo()
    info.Title = dom.SelectValue("h1.entry-title")
    info.Author = dom.SelectValue("div.author-content a")
    info.Status = dom.SelectValue("div.post-status span:contains(Status) + span")
    info.Tags = dom.SelectValues("div.genres-content a")
    info.Description = dom.SelectValue("div.description-summary div.summary__content")
end

function GetContent()
    content.Remove("script, .ads, .code-block")
    return dom.SelectValue(".text-left, .reading-content")
end
