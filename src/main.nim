import trie/trie as t

when isMainModule:
  let trie = t.newTrie()  # now safe, no conflict

  trie.insert("apple")
  trie.insert("app")

  echo "Search apple: ", trie.search("apple")
  echo "Search app: ", trie.search("app")
  echo "Prefix ap: ", trie.startsWith("ap")
  