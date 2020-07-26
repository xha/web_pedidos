<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class EstatusTransaccion
 * 
 * @property int $idEstatusTransaccion
 * @property string $descripcion
 * @property string $color
 * @property int|null $nivel
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 *
 * @package App\Models
 */
class EstatusTransaccion extends Model
{
	protected $table = 'estatus_transaccion';
	protected $primaryKey = 'idEstatusTransaccion';
	public $timestamps = false;

	protected $casts = [
		'nivel' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'color',
		'nivel',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idEstatusTransaccion');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idEstatusTransaccion');
	}
}
