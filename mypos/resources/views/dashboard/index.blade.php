@extends('layouts.dashboard.app')

@section('content')


    <div class="content-wrapper">
        <section class="content-header">

            <h1>@lang('site.dashboard')</h1>

            <!-- <ol>
                <li><i class="fa fa-dashboard"></i>@lang('site.dashboard')</li>
                <li class="active"><i class="fa fa-dashboard"></i>@lang('site.users')</li>
            </ol> -->
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-dashboard"></i>@lang('site.dashboard')</li>
                <li><a href="{{route('dashboard.users.index')}}">@lang('site.users')</a></li>
            </ol>

        </section>

        <section class="content">
            <h1>this is dashboard</h1>
        </section>
    </div>
@endsection
