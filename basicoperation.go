package main

import "fmt"

// map的增删改查
func main() {

	// 添加:
	//	当map中没有指定的key时就会自动增加

	var dict = make(map[string]string)
	fmt.Println("增加前:", dict) // map[]
	dict["name"] = "馒头"
	fmt.Println("增加后:", dict) // map[name:馒头]

	// 修改:
	//	当map中有指定的key时就会自动修改
	dict["name"] = "旺仔"
	fmt.Println("修改后:", dict) // map[name:旺仔]

	// 查询
	//	通过ok-idiom模式判断指定键值对是否存储
	value, ok := dict["name"]
	if ok {
		fmt.Println("有name这个key,值为", value)
	} else {
		fmt.Println("没有name这个key,值为", value)
	}

	// 或者使用下面的方法
	/*if value, ok := dict["name"]; ok {
		fmt.Println("有name这个key,值为", value)
	}*/

	// 删除:
	//	可以通过Go语言内置delete函数删除指定元素
	delete(dict, "name")
	fmt.Println("删除后:", dict) // map[]

	// 遍历:
	//  map的存储是无序的,所以遍历的结果可能会不一样
	var dic = map[string]string{"name": "馒头", "age": "20", "gender": "male"}
	for key, value := range dic {
		fmt.Println(key, value)
	}
}
