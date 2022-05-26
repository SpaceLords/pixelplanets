extends Node

export var planet_colorschemes = {
	"Moon Grey": PoolColorArray(["a3a7c2", "4c6885", "3a3f5e"]),
	"Black Hole Orange": PoolColorArray(["ffffeb", "fff540", "ffb84a", "ed7b39", "bd4035"]) ,
	"Terran Dry Red": PoolColorArray(["ff8933", "e64539", "ad2f45", "52333f", "3d2936"]),
	"Terran Island Blue": PoolColorArray(["92e8c0", "4fa4b8", "2c354d", "c8d45d", "63ab3f", "2f5753", "283540", "dfe0e8", "a3a7c2", "686f99", "404973"]),
	"Terran Rivers": PoolColorArray(["63ab3f", "3b7d4f", "2f5753", "283540", "4fa4b8", "404973", "f5ffe8", "dfe0e8", "686f99", "404973"]),
	"Galaxy Green": PoolColorArray(["ffffeb", "ffe478", "8fde5d", "3d6e70", "323e4f", "322947"]),
	"Gas Planet Brown": PoolColorArray(["f0b541", "cf752b", "ab5130", "7d3833", "3b2027", "3b2027", "21181b", "21181b"]),
	"Gas Planet Layered Brown": PoolColorArray(["eec39a", "d9a066", "8f563b", "663931", "45283c", "222034"]),
	"Ice World Blue": PoolColorArray(["faffff", "c7d4e1", "928fb8", "4fa4b8", "4c6885", "3a3f5e", "e1f2ff", "c0e3ff", "5e70a5", "404973"]),
	"Lava World Red": PoolColorArray(["8f4d57", "52333f", "3d2936", "52333f", "3d2936", "ff8933", "e64539", "ad2f45"]),
	"Star Blue": PoolColorArray(["ffffe4", "f5ffe8", "77d6c1", "1c92a7", "033e5e", "77d6c1", "ffffe4"])
}

export var background_colorschemes = {
	"Borkfest": PoolColorArray(['171711', '202215', '3a2802', '963c3c', 'ca5a2e', 'ff7831', 'f39949', 'ebc275', 'dfd785']),
	"NYX8": PoolColorArray(['01090f', '08141e', '0f2a3f', '20394f', '4e495f', '816271', '997577', 'c3a38a', 'f6d6bd']),
	"AMMO-8": PoolColorArray(['000a03', '040c06', '112318', '1e3a29', '305d42', '4d8061', '89a257', 'bedc7f', 'eeffcc']),
	"Winter Wonderland": PoolColorArray(['111837', '20284e', '2c4a78', '3875a1', '8bcadd', '738d9d', 'a7bcc9', 'd6e1e9', 'ffffff']),
	"Submerged Chimera": PoolColorArray(['050219', '120f28', '2e1e5c', '6d4299', '8623ae', 'de39e9', 'f792e4', 'ffd2de', 'f7faea']),
	"DREAMSCAPE8": PoolColorArray(['211921', '543344', '8b4049', 'ae6a47', 'caa05a', '515262', '63787d', '8ea091', 'c9cca1']),
	"Coffee": PoolColorArray(['000000', '000000', '0a0a0a', '191919', '533e2d', 'a27035', 'b88b4a', 'ddca7d', 'fbf9ef']),
	"FUNKYFUTURE8": PoolColorArray(['120826', '2b0f54', 'ab1f65', 'ff4f69', 'ff8142', 'ffda45', '3368dc', '49e7ec', 'fff7f8']),
	"POLLEN8": PoolColorArray(['2e242a', '73464c', 'ab5675', 'ee6a7c', 'ffa7a5', '34acba', '72dcbb', 'ffe07e', 'ffe7d6']),
	"Rust gold 8": PoolColorArray(['08141e', '202020', '393939', '725956', 'bb7f57', '331c17', '563226', 'ac6b26', 'f6cd26']),
	"SLSO8": PoolColorArray(['00172b', '0d2b45', '203c56', '544e68', '8d697a', 'd08159', 'ffaa5e', 'ffd4a3', 'ffecd6']),
	"Goosebumps Gold": PoolColorArray(['000204', '21191c', '372365', '404b77', '5a85a4', '941434', 'c82108', 'e35d08', 'd19f22']),
	"OIL6": PoolColorArray(['06060a', '11111f', '1d1d33', '272744', '494d7e', '8b6d9c', 'c69fa5', 'f2d3ab', 'fbf5ef'])
}

func _ready():
	pass # Replace with function body.
