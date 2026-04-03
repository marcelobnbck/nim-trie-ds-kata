import tables

type
  TrieNode* = ref object
    children*: Table[char, TrieNode]
    isEndOfWord*: bool

proc newTrieNode*(): TrieNode =
  TrieNode(children: initTable[char, TrieNode](), isEndOfWord: false)
  