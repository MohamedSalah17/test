@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">

        <section class="content-header">

            <h1>@lang('site.add_order')</h1>

            <ol class="breadcrumb">
                <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                <li><a href="{{ route('dashboard.students.index') }}">@lang('site.students')</a></li>
                <li class="active">@lang('site.add_orderRegits')</li>
            </ol>
        </section>
            <section class="content">

                <div class="row">

                    <div class="col-md-6">

                        <div class="box box-primary">

                            <div class="box-header">

                                <h3 class="box-title" style="margin-bottom: 10px">@lang('site.doctors')</h3>

                            </div><!-- end of box header -->

                            <div class="box-body">

                                @foreach ($doctors as $doctor)

                                    <div class="panel-group">

                                        <div class="panel panel-info">

                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" href="#{{ str_replace(' ', '-', $doctor->name) }}">{{ $doctor->name }}</a>
                                                </h4>
                                            </div>

                                            <div id="{{ str_replace(' ', '-', $doctor->name) }}" class="panel-collapse collapse">

                                                <div class="panel-body">

                                                    @if ($doctor->subjects->count() > 0)

                                                        <table class="table table-hover">
                                                            <tr>
                                                                <th>@lang('site.name')</th>
                                                                <th>@lang('site.add')</th>
                                                            </tr>

                                                            @foreach ($doctor->subjects as $subject)
                                                                <tr>
                                                                    <td>{{ $subject->name }}</td>
                                                                    <td>
                                                                        <a href=""
                                                                        id="subject-{{ $subject->id }}"
                                                                        data-name="{{ $subject->name }}"
                                                                        data-id="{{ $subject->id }}"
                                                                        class="btn btn-success btn-sm add-subject-btn">
                                                                            <i class="fa fa-plus"></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            @endforeach

                                                        </table><!-- end of table -->

                                                    @else
                                                        <h5>@lang('site.no_records')</h5>
                                                    @endif

                                                </div><!-- end of panel body -->

                                            </div><!-- end of panel collapse -->

                                        </div><!-- end of panel primary -->

                                    </div><!-- end of panel group -->

                                @endforeach

                            </div><!-- end of box body -->

                        </div><!-- end of box -->

                    </div><!-- end of col -->

                    <div class="col-md-6">

                        <div class="box box-primary">

                            <div class="box-header">

                                <h3 class="box-title">@lang('site.orderRegits')</h3>

                            </div><!-- end of box header -->

                            <div class="box-body">

                                <form action="{{ route('dashboard.students.ordersRegist.store', $student->id) }}" method="post">

                                    {{ csrf_field() }}
                                    {{ method_field('post') }}

                                    @include('partials._errors')

                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>@lang('site.subjects')</th>
                                        </tr>
                                        </thead>

                                        <tbody class="order-list" id="order-list"></tbody>

                                    </table><!-- end of table -->


                                    <button class="btn btn-primary btn-block disabled" id="add-order-form-btn"><i class="fa fa-plus"></i> @lang('site.add_order')</button>

                                </form>

                            </div><!-- end of box body -->

                        </div><!-- end of box -->

                        {{--@if ($student->ordersRegist->count() > 0)

                            <div class="box box-primary">

                                <div class="box-header">

                                    <h3 class="box-title" style="margin-bottom: 10px">@lang('site.previous_orders')
                                        <small>{{ $ordersRegist->total() }}</small>
                                    </h3>

                                </div><!-- end of box header -->

                                <div class="box-body">

                                    @foreach ($ordersRegist as $order)

                                        <div class="panel-group">

                                            <div class="panel panel-success">

                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" href="#{{ $order->created_at->format('d-m-Y-s') }}">{{ $order->created_at->toFormattedDateString() }}</a>
                                                    </h4>
                                                </div>

                                                <div id="{{ $order->created_at->format('d-m-Y-s') }}" class="panel-collapse collapse">

                                                    <div class="panel-body">

                                                        <ul class="list-group">
                                                            @foreach ($order->subjects as $subject)
                                                                <li class="list-group-item">{{ $subject->name }}</li>
                                                            @endforeach
                                                        </ul>

                                                    </div><!-- end of panel body -->

                                                </div><!-- end of panel collapse -->

                                            </div><!-- end of panel primary -->

                                        </div><!-- end of panel group -->

                                    @endforeach

                                    {{ $orders->links() }}

                                </div><!-- end of box body -->

                            </div><!-- end of box -->

                        @endif--}}


                    </div>
                </div>

            </section>
        </section>


    </div>

@endsection
