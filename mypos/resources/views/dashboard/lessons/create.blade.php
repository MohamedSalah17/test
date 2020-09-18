@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.lessons')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.lessons.index')}}">@lang('site.lessons')</a></li>
                    <li class="active">@lang('site.add')</li>

                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header">
                        <h3 class="box-title">@lang('site.add')</h3>
                    </div>

                    <div class="box-body">
                        @include('partials._errors')

                        <form action="{{route('dashboard.lessons.store')}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('post') }}

                            <div class="form-group">
                                <label>@lang('site.name')</label>
                                <input type="text" name="name" class="form-control" value="{{old('name')}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.date')</label>
                                <input type="date" name="date" class="form-control" value="{{old('date')}}">
                            </div>

                                <div class="form-group">
                                    <label>@lang('site.pdf_file')</label>
                                    <input type="file" name="pdf_file" class="form-control" value="{{old('pdf_file')}}">
                                    <!--input type="submit" value="upload"-->
                                </div>

                                <div class="form-group">
                                    <label>@lang('site.pptx_file')</label>
                                    <input type="file" name="pptx_file" class="form-control" value="{{old('pptx_file')}}">
                                    <!--input type="submit" value="upload"-->
                                </div>

                                <div class="form-group">
                                    <label>@lang('site.youtube_link')</label>
                                    <input type="text" name="youtube_link" class="form-control" value="{{old('youtube_link')}}">
                                </div>

                                {{--<div class="form-group">
                                    <label>@lang('site.doc_id')</label>
                                    <input type="text" name="doc_id"  class="form-control" value="{{$request->doc_id}}" readonly>
                                </div>--}}



                            <div class="form-group">
                                <label>@lang('site.less_sbj')</label>
                                <select name="sbj_id" class="form-control">
                                    <option value="">@lang('site.subjects')</option>
                                    @foreach ($subjects as $subject)
                                        <option value="{{$subject->id}}" {{old('sbj_id') == $subject->id ? 'selected' : ''}}>{{$subject->name}}</option>
                                    @endforeach
                                </select>
                            </div>



                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add')</button>
                            </div>
                        </form>
                    </div><!--end of box-body-->

                </div>

            </section>
        </section>


    </div>

@endsection
