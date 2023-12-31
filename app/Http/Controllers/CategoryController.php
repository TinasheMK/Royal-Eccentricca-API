<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        //
    }

    public function getCategories()
    {
        $categories = Category::whereNull('parent_id')->get();

        foreach ($categories as $p)
        {
          $p->subCategory;
          foreach ($p->subCategory as $c)
          {
            $c->subCategory;
            // if($c->products->count()==0) {
            //     $c->delete();
            //     $this->getCategories();
            // }
          }
        //   if($p->products->count()==0) {
        //     $c->delete();
        //     $this->getCategories();
        //   }
        }

        return response()->json($categories);

    }

    public function getCategoryProducts(Category $category)
    {

        $category->products()->paginate(20);

        foreach ($category->products as $p)
        {
          $p->images;
        }

        return response()->json($category->products);

    }
}
