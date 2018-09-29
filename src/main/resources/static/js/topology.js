function Topology(svg) {
    typeof(svg) == 'string' && (svg = document.getElementById(svg));
    var w = svg.parentNode.clientWidth,//svg.parentNode.clientWidth
        h = svg.parentNode.clientHeight,//svg.parentNode.clientHeight
        self = this;
    
    d3.select(svg)
    	.selectAll(".link")
    	.remove();
    
    d3.select(svg)
		.selectAll(".node")
		.remove();
    
    d3.select(svg)
		.selectAll(".dynamic")
		.remove();

    this.vis = d3.select(svg)
        .attr("width", w)
        .attr("height", h)
        .attr("pointer-events", "all");

    this.force = d3.layout.force()
        .gravity(.0)//.03
        .linkDistance(70)
        .charge(-3600)
        .alpha(0.005)
        .size([w, h])
 		.on("start",function(){//当节点开始运动时
			self.vis.selectAll(".node")
			.attr("transform", function(d) {
				var position = window.sessionStorage.getItem(d.id);//从sessionStorage里获取每个节点对应的位置，如果窗口关闭，则sessionStorage就清0了。
				if(position != null)
				{
					//alert(position);
					var dot = position.indexOf(",");//为在存储节点位置时，我存的格式是x,y，所以以,来分割横坐标和纵坐标
					if(dot>0&&dot<position.length) 
					{	
						var x = position.slice(0,dot);
						var y = position.slice(dot+1);
						return "translate(" + x + "," + y + ")";
					}
				}				
				return "translate(" + d.x + "," + d.y + ")";						
			});
           	
		})
		.on("end",function(){//当节点运动停止时
			self.vis.selectAll(".node")
			.attr("transform", function(d,i) {
				var nodeNumber = document.getElementsByClassName("node");
            	var positionX = (d.x).toString();
            	var positionY = (d.y).toString();
            	var position = positionX+','+positionY;
            	var id = d.id;
            	var tag = window.sessionStorage.getItem("tag");
            	if(tag != 1)//如果tag不为1，说明还没有存储节点位置
            	{
            		window.sessionStorage.setItem(d.id,position);
            		if(i == nodeNumber.length-1)
            		{
            			var tag = window.sessionStorage.setItem("tag",1);
                    	setInterval('initTopology()',5000); //每10秒刷新一次页面下边显示的数据
            		}

            	}
            	else//一旦tag为1，就表明sessionStorage存储过各节点位置了，就不再存储节点位置了
            	{
		            var position = window.sessionStorage.getItem(d.id);
					if(position != null)
					{
						//alert(position);
						var dot = position.indexOf(",");
						if(dot>0&&dot<position.length) 
						{	
							var x = position.slice(0,dot);
							var y = position.slice(dot+1);
							return "translate(" + x + "," + y + ")";
						}
					}
            	}

            	return "translate(" + d.x + "," + d.y + ")";
           });
		})
        .on("tick", function(x) {
            self.vis.selectAll(".node")
            	.attr("transform", function(d) {
			 		var position = window.sessionStorage.getItem(d.id);
					if(position != null)
					{
						//alert(position);
						var dot = position.indexOf(",");
						if(dot>0&&dot<position.length) 
						{	
							var x = position.slice(0,dot);
							var y = position.slice(dot+1);
							return "translate(" + x + "," + y + ")";
						}
					}
					return "translate(" + d.x + "," + d.y + ")";          
                })
               .attr("x" , function(d){
            	    if(d.x>=800)
        	    	{
            	    	d.x = 800.0;
        	    	}
            	    if(d.x<=50)
        	    	{
            	    	d.x = 50.0;
        	    	}
            		return d.x;
        		})
        		.attr("y" , function(d){
            	    if(d.y>=500)
        	    	{
            	    	d.y = 500.0;
        	    	}
            	    if(d.y<=50)
        	    	{
            	    	d.y = 50.0;
        	    	}
        			return d.y;
       			});
            self.vis.selectAll(".dynamic") //dynamic对应的是实时流量的线条 
    		.attr("stroke","#990000")             //颜色
    		.attr("stroke-width","9")
    		.attr("stroke-dasharray","20")          //虚线
    		.attr("stroke-dashoffset","5")
    		.attr("animation","dash 10s linear infinite")   //动态
    		.attr("x1", function(d) {
    	    	var position = window.sessionStorage.getItem(d.source.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_font;
					}
				}				
                 return d.source.x;
    		})
    		.attr("y1", function(d) {
    	    	var position = window.sessionStorage.getItem(d.source.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_back;
					}
				}				
                return d.source.y;
    		})
    		.attr("x2", function(d) {
    	    	var position = window.sessionStorage.getItem(d.target.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_font;
					}
				}			                   
                return d.target.x;
    		})
    		.attr("y2", function(d) {
    	    	var position = window.sessionStorage.getItem(d.target.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_back;
					}
				}	                	
                return d.target.y;
    		});
        
            self.vis.selectAll(".static")  
            .attr("x1", function(d) {
            	var position = window.sessionStorage.getItem(d.source.id);          
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_font;
					}
				}				
                return d.source.x;
            })
            .attr("y1", function(d) {
            	var position = window.sessionStorage.getItem(d.source.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_back;
					}
				}				
                return d.source.y;
            })
            .attr("x2", function(d) {
            	var position = window.sessionStorage.getItem(d.target.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_font;
					}
				}			                   
                return d.target.x;
            })
            .attr("y2", function(d) {
            	var position = window.sessionStorage.getItem(d.target.id);
				if(position != null)
				{
					var dot = position.indexOf(",");
					if(dot>0&&dot<position.length) 
					{	
						var str_font = position.slice(0,dot);
						var str_back = position.slice(dot+1);
						return str_back;
					}
				}	                	
                return d.target.y;
            });

            self.vis.selectAll(".srcPortTxt") //小圆圈中的数字
                .attr("x", function(d) {
    		 		var positionS = window.sessionStorage.getItem(d.source.id);
    		 		var positionT = window.sessionStorage.getItem(d.target.id);
    				if(positionS != null)
    				{
    					var dotS = positionS.indexOf(",");
    					var dotT = positionT.indexOf(",");
    					if(dotS>0&&dotS<positionS.length) 
    					{	
    						var str_font_source = positionS.slice(0,dotS);
    						var str_back_source = positionS.slice(dotS+1);
    						var str_font_target = positionT.slice(0,dotT);
    						var str_back_target = positionT.slice(dotT+1);
    						var offset = 50;
    					    var x1 = parseFloat(str_font_source);
    					    var y1 = parseFloat(str_back_source);
    					    var x2 = parseFloat(str_font_target);
    					    var y2 = parseFloat(str_back_target);
    					    var x_shift = x2 - x1;
    					    var y_shift = y2 - y1;
    					    var l = Math.sqrt(x_shift * x_shift + y_shift * y_shift);
    					    var o = offset / l;

    					    if (offset > 0) {
    					    	var returnX = x_shift * o + x1;
    					    	return returnX;
    					    } else {
    					    	var returnX = x_shift * o + x2;
    					    	return returnX;
    					    }   							
    					}
    				}
    				else
    				{
                        return self.offsetByLine(d, 50).x;
    				}
                })
                .attr("y", function(d) {
    		 		var positionS = window.sessionStorage.getItem(d.source.id);
    		 		var positionT = window.sessionStorage.getItem(d.target.id);
    				if(positionS != null)
    				{
    					var dotS = positionS.indexOf(",");
    					var dotT = positionT.indexOf(",");
    					if(dotS>0&&dotS<positionS.length) 
    					{	
    						var str_font_source = positionS.slice(0,dotS);
    						var str_back_source = positionS.slice(dotS+1);
    						var str_font_target = positionT.slice(0,dotT);
    						var str_back_target = positionT.slice(dotT+1);
    						var offset = 50;
    					    var x1 = parseFloat(str_font_source);
    					    var y1 = parseFloat(str_back_source);
    					    var x2 = parseFloat(str_font_target);
    					    var y2 = parseFloat(str_back_target);
    					    var x_shift = x2 - x1;
    					    var y_shift = y2 - y1;
    					    var l = Math.sqrt(x_shift * x_shift + y_shift * y_shift);
    					    var o = offset / l;
    					    if (offset > 0) {
    					    	var returnY = y_shift * o + y1 + 3;
    					    	return returnY;
    					    } else {   					    	
    					    	var returnY = y_shift * o + y2 + 3;
    					    	return returnY;
    					    }   							
    					}
    				}
    				else
    				{
                        return self.offsetByLine(d, 50).y;
    				}              	           
                });

            self.vis.selectAll(".dstPortTxt")
                .attr("x", function(d) {
    		 		var positionS = window.sessionStorage.getItem(d.source.id);
    		 		var positionT = window.sessionStorage.getItem(d.target.id);
    				if(positionS != null)
    				{
    					var dotS = positionS.indexOf(",");
    					var dotT = positionT.indexOf(",");
    					if(dotS>0&&dotS<positionS.length) 
    					{	
    						var str_font_source = positionS.slice(0,dotS);
    						var str_back_source = positionS.slice(dotS+1);
    						var str_font_target = positionT.slice(0,dotT);
    						var str_back_target = positionT.slice(dotT+1);
    						var offset = -50;
    					    var x1 = parseFloat(str_font_source);
    					    var y1 = parseFloat(str_back_source);
    					    var x2 = parseFloat(str_font_target);
    					    var y2 = parseFloat(str_back_target);
    					    var x_shift = x2 - x1;
    					    var y_shift = y2 - y1;
    					    var l = Math.sqrt(x_shift * x_shift + y_shift * y_shift);
    					    var o = offset / l;

    					    if (offset > 0) {
    					    	var returnX = x_shift * o + x1;
    					    	return returnX;
    					    } else {
    					    	var returnX = x_shift * o + x2;
    					    	return returnX;
    					    }   							
    					}
    				}
    				else
    				{
                        return self.offsetByLine(d, -50).x;
    				}
                })
                .attr("y", function(d) {
    		 		var positionS = window.sessionStorage.getItem(d.source.id);
    		 		var positionT = window.sessionStorage.getItem(d.target.id);
    				if(positionS != null)
    				{
    					var dotS = positionS.indexOf(",");
    					var dotT = positionT.indexOf(",");
    					if(dotS>0&&dotS<positionS.length) 
    					{	
    						var str_font_source = positionS.slice(0,dotS);
    						var str_back_source = positionS.slice(dotS+1);
    						var str_font_target = positionT.slice(0,dotT);
    						var str_back_target = positionT.slice(dotT+1);
    						var offset = -50;
    					    var x1 = parseFloat(str_font_source);
    					    var y1 = parseFloat(str_back_source);
    					    var x2 = parseFloat(str_font_target);
    					    var y2 = parseFloat(str_back_target);
    					    var x_shift = x2 - x1;
    					    var y_shift = y2 - y1;
    					    var l = Math.sqrt(x_shift * x_shift + y_shift * y_shift);
    					    var o = offset / l;

    					    if (offset > 0) {
    					    	var returnY = y_shift * o + y1 + 3;
    					    	return returnY;
    					    } else {   					    	
    					    	var returnY = y_shift * o + y2 + 3;
    					    	return returnY;
    					    }   							
    					}
    				}
    				else
    				{
                        return self.offsetByLine(d, -50).y;
    				}    
                });
        });

    this.nodes = this.force.nodes();
    this.links = this.force.links();
    this.mouseoverLinkHandler = function() {};
    this.mouseoutLinkHandler = function() {};
    this.mouseoverNodeHandler = function() {};
    this.mouseoutNodeHandler = function() {};
}

Topology.prototype.addNode = function(node) {
    this.nodes.push(node);
}

Topology.prototype.addNodes = function(nodes) {
    if (Object.prototype.toString.call(nodes) == '[object Array]') {
        var self = this;
        nodes.forEach(function(node) {
            self.addNode(node);
        });
    }
}

Topology.prototype.addLink = function(link) {
    link.source = this.findNode(link['source']);
    link.target = this.findNode(link['target']);
    this.links.push(link);
}

Topology.prototype.addLinks = function(links) {
    if (Object.prototype.toString.call(links) == '[object Array]') {
        var self = this;
        links.forEach(function(link) {
            self.addLink(link);
        });
    }
}

Topology.prototype.findNode = function(id) {
    var nodes = this.nodes;
    for (var i in nodes) {
        if (nodes[i]['id'] == id) return nodes[i];
    }
    return null;
}

Topology.prototype.findNodeIndex = function(id) {
    var nodes = this.nodes;
    for (var i in nodes) {
        if (nodes[i]['id'] == id) return i;
    }
    return -1;
}

Topology.prototype.updateLinks = function() {   
	   var dynamic = this.vis.selectAll(".link")
	        .data(this.links, function(d) {
	            return d.source.id + "-" + d.target.id;
	        });

	    var staticEnter = dynamic.enter().append("g")
	        .attr("class", "lineGroup")
	        .on("mouseover", this.mouseoverLinkHandler)
	        .on("mouseout", this.mouseoutLinkHandler);

	    staticEnter.append("line")
        .attr("class", function(d){
        	return d.type;
        })
        .attr("marker-start", function(d){
        	var src_type = d.src_type;
        	if (src_type == "host"){
        		return "";
        	}
        	else {
        		return "url(#markerStart)";
        	}
        })
        .attr("marker-end", function(d){ //只显示交换机的端口
        	var dst_type = d.dst_type;
        	if (dst_type == "host"){
        		return "";
        	}
        	else {
        		return "url(#markerEnd)";
        	}
        })
        /*
        staticEnter.append("text")
        .attr("class", "linetext srcPortTxt")
        .text(function(d) {
            return d.src_port;
        });
        staticEnter.append("text")
        .attr("class", "linetext dstPortTxt")
        .text(function(d) {
            return d.dst_port;
        }); */
	    dynamic.exit().remove();
	}

Topology.prototype.updateNodes = function() {
    var node = this.vis.selectAll(".node")
        .data(this.nodes, function(d) {
            return d.id;
        })
        .attr("x" , function(d){
            return d.x;
        })
        .attr("y" , function(d){
            return d.y;
       	});

    var nodeEnter = node.enter().append("g")
        .attr("class", "node")
        .on("mouseover", this.mouseoverNodeHandler)
        .on("mouseout", this.mouseoutNodeHandler)
        .call(this.force.drag);

    var self = this;
    /*
    nodeEnter.append("circle")
        .attr("class", "nodeCircle")
        .attr("r", "18");//图标圆半径*/
    
    nodeEnter.append("text")
        .attr("class", "nameText")
    	.attr("dx",function(d){
    		var nodeType = d.type_output;
    		if (nodeType == "host"){ //因为主机的ID名字长，所以移动的距离也大
    			return -50;
    		}
    		else {
    			return -30;
    		}
    	})
        .attr("dy", 55)
        .text(function(d) {
            return d.id;
        });
    //Use Image
    nodeEnter.append("image")
        .attr("class", "nodeImg")
        .attr("xlink:href", function(d) {
            return d.type + ".png";
        })
        .attr("x", -40)
        .attr("y", -40)
        .attr("width", 80)
        .attr("height", 80);

    node.exit().remove();
}

Topology.prototype.update = function() {
    this.updateLinks();
    this.updateNodes();
    this.force.start();
}

Topology.prototype.init = function(data) {
	this.addNodes(data.nodes);
    this.addLinks(data.links);
    this.update();
}

Topology.prototype.offsetByLine = function(d, offset) {
    var x1 = d.source.x;
    var y1 = d.source.y;
    var x2 = d.target.x;
    var y2 = d.target.y;
    var x_shift = x2 - x1;
    var y_shift = y2 - y1;
    var l = Math.sqrt(x_shift * x_shift + y_shift * y_shift);
    var o = offset / l;

    if (offset > 0) {
        return {
            x: x_shift * o + x1,
            y: y_shift * o + y1 + 3
        };
    } else {
        return {
            x: x_shift * o + x2,
            y: y_shift * o + y2 + 3
        };
    }
}