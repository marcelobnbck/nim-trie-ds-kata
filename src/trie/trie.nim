import tables
import ./node

type
  Trie* = ref object
    root*: TrieNode

proc newTrie*(): Trie =
  Trie(root: newTrieNode())

proc insert*(trie: Trie, word: string) =
  var current = trie.root
  for ch in word:
    if not current.children.hasKey(ch):
      current.children[ch] = newTrieNode()
    current = current.children[ch]
  current.isEndOfWord = true

proc findNode(trie: Trie, str: string): TrieNode =
  var current = trie.root
  for ch in str:
    if not current.children.hasKey(ch):
      return nil
    current = current.children[ch]
  return current

proc search*(trie: Trie, word: string): bool =
  let node = trie.findNode(word)
  return node != nil and node.isEndOfWord

proc startsWith*(trie: Trie, prefix: string): bool =
  return trie.findNode(prefix) != nil
