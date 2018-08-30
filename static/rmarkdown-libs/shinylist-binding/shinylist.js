HTMLWidgets.widget({

  name: 'shinylist',

  type: 'output',

  initialize: function(el, width, height) {

    return {

    };

  },

  renderValue: function(el, x, instance) {

        // get values from R input
        var values = x.dat;

        // map JSON elements to string
        values = values.map(function(z){
                return JSON.stringify(z);
                    });

        // define function to parse array input
        function makeList(array, ordered) {

        var list = document.createElement(ordered);

        for(var i = 0; i < array.length; i++) {
            var item = document.createElement('li');

            item.appendChild(document.createTextNode(array[i]));

            list.appendChild(item);
        }

        return list;
        }


        var node = document.getElementById(el.id);

        var nodeChildren = node.childNodes;

        // check if child node has element (to be updated)
        if (nodeChildren[0])
        node.replaceChild(makeList(values, x.ordered), nodeChildren[0]);
        else
            node.appendChild(makeList(values, x.ordered));


    },

  resize: function(el, width, height, instance) {

    }

});