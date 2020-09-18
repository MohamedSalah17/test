@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.lessons')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.lessons.pptx_details')}}">@lang('site.lessons')</a></li>
                    <li class="active">@lang('site.add')</li>

                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header">
                        <h3 class="box-title">@lang('site.details')</h3>
                    </div>

                    <div class="box-body">

                        <p>
                            <iframe src="{{url('storage/'.$data->pptx_file)}}" frameborder="0"></iframe>
                        </p>
                    </div>
                </div>

            </section>
        </section>


    </div>

@endsection
