-- {"id":999999999,"ver":"1.0.0","libVer":"1.0.0","author":"You","name":"Cliche Novel","lang":"en","url":"https://clichenovel.com"}

require("WordPress")

function Register()
    module.Name = "Cliche Novel"
    module.Language = "English"
    module.Type = "Web Novel"
    module.Domain = "clichenovel.com"
end

function GetInfo()
    info.Title = dom.SelectValue("h1.entry-title")
    info.Author = dom.SelectValue(".author-content a")
    info.Tags = dom.SelectValues(".genres-content a")
    info.Status = dom.SelectValue(".post-status span:contains(Status) + span")
    info.Description = dom.SelectValue(".description-summary .summary__content")
end

function GetChapters()
    for chapter in dom.SelectElements(".wp-manga-chapter a") do
        local url = chapter.SelectValue("@href")
        local title = chapter.SelectValue("text()")
        chapters.Add(url, title)
    end
    chapters.Reverse()
end

function GetContent()
    content.Remove("script")
    content.Remove(".code-block")
    return dom.SelectValue(".text-left, .reading-content")
end
