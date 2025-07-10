#requires AutoHotkey v2

OnClipboardChange ClipChanged

clipList := Array()
ClipChanged(type) {
	text := A_Clipboard

	if (!text) {
		return
	}

	hasText := false
	Loop clipList.Length {
		if (text == clipList[A_Index]) {
			hasText := true
			break
		}
	}
	if hasText {
		return
	}

	clipList.InsertAt(1, text)

	if (clipList.Length > 10) {
		Loop clipList.Length - 10 {
			clipList.Pop()
		}
	}
}

pasteText(texts) {
	;SendText texts
	;ClipSaved := ClipboardAll()   ; 把整个剪贴板保存到您选择的变量中.
	; ... 这里临时使用剪贴板, 比如快速粘贴大量文本 ...
	A_Clipboard := texts
	SendInput "+{Ins}"
	;A_Clipboard := ClipSaved   ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
	;ClipSaved := ""  ; 在剪贴板含有大量内容时释放内存.
}

$#v::{
	global clipList
	if A_IsCompiled {
		dirPath := A_ScriptDir
	} else {
		SplitPath(A_LineFile, &fileName, &dirPath)
	}

	; 清空旧的菜单窗口
	static windowListMenu := ""
	if (windowListMenu) {
		windowListMenu.Delete()
	} else {
		windowListMenu := Menu()
		;windowListMenu.SetColor("EEAA99")
	}

	; 剪贴板列表显示最大长度的字符串
	maxStrLen := 70

	Loop clipList.Length {
		texts := Trim(clipList[A_Index])
		title := SubStr(texts, 1, maxStrLen)
		title := StrReplace(title, "&", "&&")
		if StrLen(texts) > maxStrLen {
			title := title . "..."
		}

		numset := Mod(A_Index, 10)
		windowListMenu.Add("&" numset "    " title, (ItemName, ItemPos, MyMenu) => pasteText(clipList[ItemPos]))
		windowListMenu.SetIcon("&" numset "    " title, dirPath "\icons\" numset ".ico", 1, 16)
	}

	windowListMenu.Show()
}
