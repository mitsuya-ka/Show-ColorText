function Show-ColorText {
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipeLineByPropertyName = $true, Position = 0)]
		[String] $Line,
		[ValidateSet('Black', 'BrightBlack', 'White', 'BrightWhite', 'Red', 'BrightRed', 'Magenta', 'BrightMagenta', `
				'Blue', 'BrightBlue', 'Cyan', 'BrightCyan', 'Green', 'BrightGreen', 'Yellow', 'BrightYellow')]
		[String] $Color,
		[string] $Word,
		[switch] $CaseSensitive
	)
	begin {
		if ( $CaseSensitive ) {
			$sw = "Ordinal"
		}
		else {
			$sw = "OrdinalIgnoreCase"
		}
	}
	process {
		if ( $PSStyle ) {
			if ( $Word ) {
				$index = $Line.IndexOf($Word, [System.StringComparison]::$sw)
				$str = $null
				while ($index -ge 0) {
					$str += $Line.Substring(0, $index)
					$str += $PSStyle.Foreground.$Color + $Line.Substring($index, $Word.Length) + $PSStyle.Reset
					$used = $Word.Length + $index
					$remain = $Line.Length - $used
					$Line = $Line.Substring($used, $remain)
					$index = $Line.IndexOf($Word, [System.StringComparison]::$sw)
				}
				$str += $Line
				$str
			}
			else {
				$PSStyle.Foreground.$Color + $Line + $PSStyle.Reset
			}
		}
		else {
			$Line
		}
	}
}
