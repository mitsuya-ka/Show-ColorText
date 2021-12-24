# Show-ColorText
show color text by ansi
(c.f)
PS >Show-ColorText -Line "abc012ABC" -Color Red -Word "abc" -CaseSensitive

PS >"abc012ABC" | Show-ColorText -Color Red -Word "abc"

PS >"abc012ABC" | Show-ColorText -Color Red
