<h2>Lucee</h2>
<cfscript>
function flattenTree(tree, parentTree=[]) {
	var out = [];
	for (var key in tree){
		var children = tree[key];
		var newTree = parentTree;
		newTree.append(key);
		if (structCount(children)) {
			var childTrees = flattenTree(children, newTree);
			for (var childTree in childTrees){
				out.append(childTree);
			}
		} else {
			out.append(newTree);
		}
	}
	return out;
}


function createTree(category, left=0, right) {
	var tree = {};
	for (var cat in category){
		var range = category[cat];
		if (range.left == left + 1 && (!structKeyExists(arguments, "right") || range.right < right)) {
			tree[cat] = createTree(category, range.left, range.right);
			left = range.right;
		}
	}
	return tree;
}

public array function getNavJSON(string mode = "NavActive"){
//	var nav = getNav();

category = {
	A = {left = 1, right = 20},
	B = {left = 2, right = 3},
	C = {left = 4, right = 19},
	D = {left = 5, right = 10},
	E = {left = 6, right = 7},
	F = {left = 8, right = 9},
	G = {left = 11, right = 18},
	H = {left = 12, right = 17},
	I = {left = 13, right = 14},
	J = {left = 15, right = 16}
};




	var tree = createTree(category);
	dump(tree);
	echo("<hr>");
	tree = flattenTree(tree);
	dump(tree);
	abort;
}
category = {
	A = {left = 1, right = 20},
	B = {left = 2, right = 3},
	C = {left = 4, right = 19},
	D = {left = 5, right = 10},
	E = {left = 6, right = 7},
	F = {left = 8, right = 9},
	G = {left = 11, right = 18},
	H = {left = 12, right = 17},
	I = {left = 13, right = 14},
	J = {left = 15, right = 16}
};

tree = createTree(category);
writeDump(tree);
tree = flattenTree(tree);
writeDump(tree);
</cfscript>