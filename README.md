# ClipboardHistory.ahk - Access and Manage Windows Clipboard History with AutoHotkey

[![GitHub stars](https://img.shields.io/github/stars/nperovic/ClipboardHistory?style=social)](https://github.com/nperovic/ClipboardHistory/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/nperovic/ClipboardHistory?style=social)](https://github.com/nperovic/ClipboardHistory/network/members)
[![GitHub issues](https://img.shields.io/github/issues/nperovic/ClipboardHistory)](https://github.com/nperovic/ClipboardHistory/issues)
[![GitHub license](https://img.shields.io/github/license/nperovic/ClipboardHistory)](https://github.com/nperovic/ClipboardHistory/blob/main/LICENSE)

An AutoHotkey v2 library for interacting with the Windows Clipboard History, leveraging the WinRT API for enhanced functionality and performance. This library allows you to retrieve, manipulate, and utilize clipboard history items efficiently.

## Features

### 📋 Access Clipboard History Items
Retrieve a list of all items stored in the clipboard history and get the text, HTML, and other supported formats of each history item.

### 🗑️ Manage Clipboard History
Clear the clipboard history or delete individual items.

### 🔄 Set Clipboard History Item as Current Content
Replace the current clipboard content with a selected history item.

## Requirements

- AutoHotkey v2+
- Windows 10 or later (with Clipboard History enabled in System Settings)

## Installation

1. **Download:** Download the library files from the [GitHub repository](https://github.com/nperovic/ClipboardHistory).
2. **Place Files:**
    - Place `ClipboardHistory.ahk` in the same directory as your main AutoHotkey script (e.g., `YourMainScript.ahk`).
    - Place the `winrt.ahk-main` folder in the `Lib` folder within your script's directory.
3. **Include in Script:**
    - If `ClipboardHistory.ahk` is in the same directory as `YourMainScript.ahk`:

        ```autohotkey
        #Include ClipboardHistory.ahk
        ```
      Directory structure should look like this: 
        ```
        ...\AutoHotkey\
            ├── YourMainScript.ahk
            ├── ClipboardHistory.ahk
            └── Lib\
                └── winrt.ahk-main\
                    ├── winrt.ahk
                    ├── windows.ahk
                    └── ...
        ```
    - If `ClipboardHistory.ahk` is in a `Lib` folder:

        ```autohotkey
        #Include <ClipboardHistory>
        ```
      Directory structure should look like this:
        ```
        ...\AutoHotkey\
            ├── YourMainScript.ahk
            └── Lib\
                ├── ClipboardHistory.ahk
                └── winrt.ahk-main\
                    ├── winrt.ahk
                    ├── windows.ahk
                    └── ...
        ```

## Usage

The library provides a `ClipboardHistory` class with static methods and properties for interacting with the clipboard history.

### Basic Example

1. Display all clipboard history items in message boxes:

    ```ahk
    #requires AutoHotkey v2
    #Include <ClipboardHistory> ; Or #Include ClipboardHistory.ahk if not using the Lib folder
    
    if (!A_IsCompiled && A_LineFile = A_ScriptFullPath)
        Loop count := ClipboardHistory.Count
            if texts := ClipboardHistory.GetText(A_Index)
                MsgBox(texts, "Clipboard History Item Index: " A_Index " of " count)
    ```

2. Retrieves the third item from your clipboard history and places it into your current clipboard. (This works with any type of content.)  

    ```cpp
    ClipboardHistory.SetItemAsContent(3)
    ```
    > ![image](https://github.com/user-attachments/assets/010e09d5-56e5-4b73-b33e-f50816ebf4c7)

### Key Properties

| Property               | Description                                                     |
| ---------------------- | --------------------------------------------------------------- |
| `Count`                | Returns the number of items in the clipboard history.           |
| `IsEnabled`            | Checks if clipboard history is enabled.                         |

### Key Methods

| Method                 | Description                                                     |
| ---------------------- | --------------------------------------------------------------- |
| `GetText(index)`       | Retrieves the text content of the item at the specified index.  |
| `GetHtml(index, convertToText, &source?)` | Retrieves the HTML content of the item at the specified index. Optionally converts HTML to plain text and retrieves the source URL. |
| `AvailableFormats(indexOrContent)` | Returns a pipe-separated list of available formats for the given index or content. |
| `Clear()`              | Clears the entire clipboard history.                            |
| `DeleteItem(indexOrItem)` | Deletes a specific item from the history.                      |
| `SetItemAsContent(index)` | Sets a history item as the current clipboard content.         |

## API Reference

For detailed information on the API, please refer to the [Microsoft Learn documentation](https://learn.microsoft.com/en-us/uwp/api/windows.applicationmodel.datatransfer.clipboard?view=winrt-26100).

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the [MIT License](https://github.com/nperovic/ClipboardHistory/blob/main/LICENSE).
