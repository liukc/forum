var check = false;
// noinspection JSAnnotator
var vm = new Vue({
    el: '#no-mode-translate-demo',
    data: {
        on: false,
        styleObject:{
            backgroundColor:'white'
        }
    },
    methods:{
       change: function(on) {
           this.on = on;
            if(this.on === true){
                this.styleObject.backgroundColor = 'grey'
            }else
                this.styleObject.backgroundColor = 'white'
        }
    }
})