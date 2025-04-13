-- {"id":1234567890,"ver":"1.0.0","libVer":"1.0.0","author":"YourName","name":"Cliche Novel","lang":"en","url":"https://clichenovel.com"}

require("WordPress")

function Register()
    module.Name = "Cliche Novel"
    module.Language = "English"
    module.Type = "Web Novel"
    module.Domain = "clichenovel.com"
end

function GetInfo()
    info.Title = dom.SelectValue("h1.entry-title")
    info.Author = dom.SelectValue("span:contains(Author) + span")
    info.Tags = dom.SelectValues("span:contains(Genre) + span a")
    info.Status = dom.SelectValue("span:contains(Status) + span")
    info.Description = dom.SelectValue(".entry-content p")
end

function GetChapters()
    for chapter in dom.SelectElements(".wp-manga-chapter a") do
        local chapterUrl = chapter.SelectValue("@href")
        local chapterTitle = chapter.SelectValue("text()")
        chapters.Add(chapterUrl, chapterTitle)
    end
    chapters.Reverse()
end

function GetContent()
    content.Remove(".code-block") -- remove ads/code blocks
    content.Remove("script")
    content.Exclude("div")
    content.Exclude("p:contains(Translator)")
    return dom.SelectValue(".text-left")
end
