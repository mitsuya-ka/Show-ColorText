# Show-ColorText
show color text by ansi

PS >Show-ColorText -Line "abc012ABC" -Color Red -Word "abc" -CaseSensitive -> PS >Red"abc"012ABC

PS >"abc012ABC" | Show-ColorText -Color Red -Word "abc" -> PS >Red"abc"012Red"ABC"

PS >"abc012ABC" | Show-ColorText -Color Red -> PS >Red"abc012ABC"
